Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 861177D2B1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 09:58:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Z1jd5J8kz4b;
	Wed,  3 Apr 2019 11:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554285494;
	bh=Y3IuqWcxLdyYJqNdC0bTIfTky3w6kZvkrQHhSWfzFcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6OQK6of8A8D6RzifVbyhAD4trnaAnjENfmHofqg526Gx+aQV9QXCGEh36GwYGcFe
	bJPjCl1toG+CkdyTF0V22X1U2vXdC0d3k71OBy5yrMdNH6oQHQ7v6p5/l+c0KxdYCB
	+gfgceqFkqG96DeFmqd+2NfDjgV4Bi7dKbas5KAhOUrAO94o/3oprRpqmRMOBSYg+P
	ipA1gDp1mnBWfRTUugod8u5+NCD+ac3GsptykS2LdvYwQMWDe0WYiorBB6cj2z2yVO
	YkbJAiSN99lj/Ru3ifsF1CVHUhexh/Gr8Ixb7wzEgMhFxbMbd6+RvUDb8PP342aDtM
	7Y/MEFq82x3wtEmaAJi+pWuknEXhJVEiUHqSK/wZ+FCrtQwvee//4Sy4HhATuuiNK5
	bHdJ8JigoWkbQmGZVhsOwVFxG1cuQabC6pk1xF+Sh82o/jEctOoYSN6cNpCSIv5U2M
	VQ2h9D0ckM+QPuq2WvQTuayj3IcM088HyqjFgKVC0nT9aKClR5C86vlqUfj/vSbirD
	Zi0dCDmJufVcW3Lg106ZL0pdshexukD70MzFiaRPm+WrJqWkHFit3yK+jEsBPrJ9t/
	oJZcUM0YehpY2LbeBlRtX/7DUHvbdI3KVGEDIgGtl2zP3d/jHcXXf7JRoScLaauL26
	gBrk6L//Jb1Mh2iPKg3zHgwI=
Date: Wed, 3 Apr 2019 12:58:11 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Changqing Li <changqing.li@windriver.com>
Message-ID: <20190403095811.GB8376@localhost>
References: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
	<20190402113135.GA27866@localhost>
	<3381bfd6-b3ed-da15-69dc-394fc1a9643b@windriver.com>
MIME-Version: 1.0
In-Reply-To: <3381bfd6-b3ed-da15-69dc-394fc1a9643b@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Wed, 03 Apr 2019 09:58:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 03, 2019 at 10:29:08AM +0800, Changqing Li wrote:
> 
> On 4/2/19 7:31 PM, Adrian Bunk wrote:
> > On Tue, Apr 02, 2019 at 05:08:33PM +0800, changqing.li@windriver.com wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > > 
> > > fix below compile error with -Werror=maybe-uninitialized
> > > 
> > > | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > |      *out_gltype = gltype;
> > > |      ~~~~~~~~~~~~^~~~~~~~
> > > | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > |      *out_glintformat = glintformat;
> > > |      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
> > > ...
> > Looking at the code, is this a failure that only happens with DEBUG_FLAGS?
> Yes, only happen with DEBUG_FLAGS
> > > +--- a/cogl/driver/gl/gles/cogl-driver-gles.c
> > > ++++ b/cogl/driver/gl/gles/cogl-driver-gles.c
> > > +@@ -74,9 +74,9 @@ _cogl_driver_pixel_format_to_gl (CoglContext *context,
> > > +                                  GLenum *out_gltype)
> > > + {
> > > +   CoglPixelFormat required_format;
> > > +-  GLenum glintformat;
> > > ++  GLenum glintformat = 0;
> > > +   GLenum glformat = 0;
> > > +-  GLenum gltype;
> > > ++  GLenum gltype = 0;
> > > ...
> > Assigning random values to variables is a bug,
> > they do not even seem to be valid values for these variables.
> 
> According to code logic,  glformat and glintformat will assigned
> simultaneously and usually with same value,

But glformat has an assert later to ensure the 0 doesn't leak anywhere.

> and 0 mean invalid pixel format.

For pixel format 0 means COGL_PIXEL_FORMAT_ANY.

For glintformat I don't know what would happen if 0 is used.

> [snip]
> 
>     case COGL_PIXEL_FORMAT_DEPTH_24_STENCIL_8:
>       glintformat = GL_DEPTH_STENCIL;
>       glformat = GL_DEPTH_STENCIL;
>       gltype = GL_UNSIGNED_INT_24_8;
>       break;
> 
> and for gtype, there also should be no problem according to the code logic.

According to the current code.

If some future change breaks the code, it would pass invalid data at 
runtime instead of giving a compile warning.

> and the fix is just for eliminate the error when DEBUG_FLAGS is enabled.

Looking at the code, does passing --enable-maintainer-flags=no
to configure work around this gcc bug?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


