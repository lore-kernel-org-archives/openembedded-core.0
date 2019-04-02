Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DAC0D6D6F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 11:31:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44YRqt2Vl5z54;
	Tue,  2 Apr 2019 13:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1554204698;
	bh=G+Cpv53MDKWi1xyWDIs2yAL/evQH0g/b9gkQZVweiAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewq+zoI0VXsNSsvI6Pcii1ZHJvXl1wCrEjxEX0N3r39cAa1S9+2aeolFvwFsifMRm
	iodaFbo6zxDGkyzXa38RMfFI8mzEhznr2VnV4YKlkOTSQG0vPPb7kx95Ba5SUF1rjJ
	uX0hPGyKWdaV5mNc0yVZZw9xCG4rBBNZm0r3TN1b3vuCCsBPMYeTr746apR0W98b16
	KNID4w87FlODAuCDYYpmez7E9KInuXi9VaUIph/ePIvKorIbyIPqLCxQhrGh6b1b4r
	aGJAW1XWDYC4r2eNUdPmX6ApHq/+tgSGY59zz9jrIdr5WYbBrs0jWyBbD6CUTo4TmE
	eN9xkllmYJYtybrGfo+9CUkCtSOnd2aBX6Lsr8p7LrC2Us6FmO5D10f+REZuxnom9t
	+6ywep2DUS3w0825HebpYgu4b2NRdX/RCGl/uc7WzD0Wnz/JTX/Oj+pEELeEFQiW5i
	bnuWwccKJyF9FdUVF/QUdjo1vzigVkvqWChoKhQulgKaHPySG4YJk60l54fPChGC2I
	oesr0sTZSzbLbLXFcJ4rGL/5sD9LGE/Z+RcnR+34nCg+VUp0LaGzHbXYMt35pGdDcF
	en2qZb+UPF7dOiz3TC7ZJaRYDPNFzJ0DP+8neeqTS+J3T/SAPGuLLGnA8gJNTJnE3p
	ERBej9PG5xY+QHZsP+z9g5Ew=
Date: Tue, 2 Apr 2019 14:31:35 +0300
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190402113135.GA27866@localhost>
References: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
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
X-List-Received-Date: Tue, 02 Apr 2019 11:31:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 02, 2019 at 05:08:33PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> fix below compile error with -Werror=maybe-uninitialized
> 
> | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:217:17: error: 'gltype' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |      *out_gltype = gltype;
> |      ~~~~~~~~~~~~^~~~~~~~
> | ../../cogl-1.22.2/cogl/driver/gl/gles/cogl-driver-gles.c:213:22: error: 'glintformat' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> |      *out_glintformat = glintformat;
> |      ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>...

Looking at the code, is this a failure that only happens with DEBUG_FLAGS?
 
> +--- a/cogl/driver/gl/gles/cogl-driver-gles.c
> ++++ b/cogl/driver/gl/gles/cogl-driver-gles.c
> +@@ -74,9 +74,9 @@ _cogl_driver_pixel_format_to_gl (CoglContext *context,
> +                                  GLenum *out_gltype)
> + {
> +   CoglPixelFormat required_format;
> +-  GLenum glintformat;
> ++  GLenum glintformat = 0;
> +   GLenum glformat = 0;
> +-  GLenum gltype;
> ++  GLenum gltype = 0;
>...

Assigning random values to variables is a bug,
they do not even seem to be valid values for these variables.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


