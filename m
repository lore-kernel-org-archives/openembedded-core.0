Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2803C79894
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 03:06:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9A36W7D013544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Oct 2018 20:06:32 -0700 (PDT)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 9 Oct 2018 20:06:18 -0700
To: Khem Raj <raj.khem@gmail.com>, ChenQi <Qi.Chen@windriver.com>
References: <1535967326-32322-1-git-send-email-hongxu.jia@windriver.com>
	<2ef6aa73-a3bd-d14a-11ef-66b8c02aecc1@windriver.com>
	<CAMKF1spfZM_hxKfRYtVPeT-8FZa3RUUOxSkd-Rmb9cajMrS0iQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <22295880-3260-246f-796a-3fbbe8638600@windriver.com>
Date: Wed, 10 Oct 2018 11:06:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spfZM_hxKfRYtVPeT-8FZa3RUUOxSkd-Rmb9cajMrS0iQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] webkitgtk: add opengl to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 10 Oct 2018 03:06:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年10月09日 09:53, Khem Raj wrote:
> On Mon, Oct 8, 2018 at 6:47 PM ChenQi <Qi.Chen@windriver.com> wrote:
>> ping
>>
>> I think webkitgtk does require the 'opengl' distro feature.
>>
>> We have in mesa.inc:
>> PACKAGECONFIG ??= ".... \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
>> 'opengl egl gles gbm dri', '', d)} \
>>                      ..."
>>
>> PROVIDES = " \
>>       ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl',
>> '', d)} \
>>       ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1
>> virtual/libgles2', '', d)} \
>>       ..."
>>
>> And webkitgtk's source codes are like:
>> #if USE(LIBEPOXY)
>> // libepoxy headers have to be included before <ANGLE/ShaderLang.h> in
>> order to avoid
>> // picking up khrplatform.h inclusion that's done in ANGLE.
>> #include <epoxy/gl.h>
>> #endif
>>
>> #include <ANGLE/ShaderLang.h>
>> #include <wtf/text/WTFString.h>
>>
>> #if PLATFORM(IOS)
>> #import <OpenGLES/ES2/glext.h>
>> #elif PLATFORM(MAC)
>> #include <OpenGL/gl.h>
>> #elif PLATFORM(WIN)
>> #include "OpenGLESShims.h"
>> #elif USE(LIBEPOXY)
>> // <epoxy/gl.h> already included above.
>> #elif USE(OPENGL_ES_2)
>> #include <GLES2/gl2.h>
>> #else
>> #include "OpenGLShims.h"
>> #endif
>>
>> And libepoxy is wrapper around libgl.
>>
>> So I think we can conclude 'opengl' is required distro feature for
>> webkitgkt? At least this is the current situation in OE.
> some sort of GL is needed yes. We indicate that with opengl losely
> in OE
>
OK, I will send V2 since webkitgtk is upgraded to 2.20.5

and the weston backport fix is obsolete since weston is upgraded to 5.0

//Hongxu

>> Best Regards,
>> Chen Qi
>>
>> On 09/03/2018 05:35 PM, Hongxu Jia wrote:
>>> They can't be built without opengl in DISTRO_FEATURES.
>>> [snip]
>>> |webkitgtk-2.20.3/Source/WebCore/platform/graphics/OpenGLShims.h:23:10:
>>> fatal error: GL/gl.h: No such file or directory
>>> [snip]
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>    meta/recipes-sato/webkit/webkitgtk_2.20.3.bb | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
>>> index a528c5d..93d74bb 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
>>> @@ -29,8 +29,7 @@ SRC_URI[sha256sum] = "579b307d78fa16a73f112790178022166d7ad17d4147492ced9b9fba48
>>>
>>>    inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>>>
>>> -# depends on libxt
>>> -REQUIRED_DISTRO_FEATURES = "x11"
>>> +REQUIRED_DISTRO_FEATURES = "x11 opengl"
>>>
>>>    DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
>>>               gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native gperf-native sqlite3 \
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



