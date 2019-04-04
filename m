Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F07297D29F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 02:06:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3426m8g027674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Apr 2019 19:06:48 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 3 Apr 2019 19:06:47 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
	<20190402113135.GA27866@localhost>
	<3381bfd6-b3ed-da15-69dc-394fc1a9643b@windriver.com>
	<20190403095811.GB8376@localhost>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <c232147c-1fe0-e983-277e-ad3ee1049abb@windriver.com>
Date: Thu, 4 Apr 2019 10:06:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190403095811.GB8376@localhost>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2019 02:06:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/3/19 5:58 PM, Adrian Bunk wrote:
> On Wed, Apr 03, 2019 at 10:29:08AM +0800, Changqing Li wrote:
>> On 4/2/19 7:31 PM, Adrian Bunk wrote:
>>> On Tue, Apr 02, 2019 at 05:08:33PM +0800, changqing.li@windriver.com wrote:
>>>> From: Changqing Li <changqing.li@windriver.com>
>>>>
>>>> fix below compile error with -Werror=maybe-uninitialized
>>>>
>>>> | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>> |      *out_gltype = gltype;
>>>> |      ~~~~~~~~~~~~^~~~~~~~
>>>> | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>>> |      *out_glintformat = glintformat;
>>>> |      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>>>> ...
>>> Looking at the code, is this a failure that only happens with DEBUG_FLAGS?
>> Yes, only happen with DEBUG_FLAGS
>>>> +--- a/cogl/driver/gl/gles/cogl-driver-gles.c
>>>> ++++ b/cogl/driver/gl/gles/cogl-driver-gles.c
>>>> +@@ -74,9 +74,9 @@ _cogl_driver_pixel_format_to_gl (CoglContext *context,
>>>> +                                  GLenum *out_gltype)
>>>> + {
>>>> +   CoglPixelFormat required_format;
>>>> +-  GLenum glintformat;
>>>> ++  GLenum glintformat = 0;
>>>> +   GLenum glformat = 0;
>>>> +-  GLenum gltype;
>>>> ++  GLenum gltype = 0;
>>>> ...
>>> Assigning random values to variables is a bug,
>>> they do not even seem to be valid values for these variables.
>> According to code logic,  glformat and glintformat will assigned
>> simultaneously and usually with same value,
> But glformat has an assert later to ensure the 0 doesn't leak anywhere.
>
>> and 0 mean invalid pixel format.
> For pixel format 0 means COGL_PIXEL_FORMAT_ANY.
>
> For glintformat I don't know what would happen if 0 is used.
>
>> [snip]
>>
>>      case COGL_PIXEL_FORMAT_DEPTH_24_STENCIL_8:
>>        glintformat = GL_DEPTH_STENCIL;
>>        glformat = GL_DEPTH_STENCIL;
>>        gltype = GL_UNSIGNED_INT_24_8;
>>        break;
>>
>> and for gtype, there also should be no problem according to the code logic.
> According to the current code.
>
> If some future change breaks the code, it would pass invalid data at
> runtime instead of giving a compile warning.
>
>> and the fix is just for eliminate the error when DEBUG_FLAGS is enabled.
> Looking at the code, does passing --enable-maintainer-flags=no
> to configure work around this gcc bug

Hi, Adrian

Thanks for your detailed comments. And the future change wrong is 
reasonable, but according to

current code,  seems it can assert from g_assert_not_reached or g_assert 
when glformat/glintformat is not assigned new value.

[snip]

     case xxx

            glformat=xxx

            glintformat=xxx

     case COGL_PIXEL_FORMAT_ANY:
     case COGL_PIXEL_FORMAT_YUV:
       g_assert_not_reached ();
       break;
     }

   /* All of the pixel formats are handled above so if this hits then
      we've been given an invalid pixel format */
   g_assert (glformat != 0);


And also upstream have use same way to fix under 
cogl/driver/gl/gl/cogl-driver-gl.c

https://gitlab.gnome.org/GNOME/cogl/commit/ca5226513eb64bceb38ca01994799c4e7cd9f5fa

so I think we can fix same way under this 
cogl/driver/gl/gles/cogl-driver-gles.c

>
> cu
> Adrian
>
-- 
BRs

Sandy(Li Changqing)


