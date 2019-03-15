Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BF80C7C740
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 10:45:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44LMgQ2wbMz7G;
	Fri, 15 Mar 2019 11:45:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552646754;
	bh=n9fyFnqpDLWCkijJfLFJpesznCraV0veTDIme25qIpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIahsZZPwfMiYjDvMiMT4v+A4IZ+iYH1RqqWbImoz+mGF7hyPFYC9udWe9zJbPG80
	C4uawgadFgreS67K/x4WzTUWtJQV4i3fRtiAnqccSh6CkhdKdrYbMYxy3R4yRwkESa
	8JusmdjzKoajK04j7q9awOdSw2hOwrRlQhruvEPZssQR7Qlnlb+6F/JBDKNxd9GZZU
	JdHvx4K8FL1b9R1r/A9QpQdjNIRdIEuLYikY7Ce9EEve98vxMJEaXq8G4MTMBsZtjF
	JsDaZx7DiopfPV3pqgbVSiLWE6+aIpvje0miJ1ywcaGB1VSMhuaT+lf3LXdTZWP7Y8
	fy3qFqnOsYOSsjXOLkHxmd41bY3Hcu3ShzC2OXP0Wn4xpNdOp0Od4fvVRXbN66JPGm
	6fd1hAIhpQDGWdIV7CfAp2Md1ftmKSxOqnbfPtLC4yh5RCd+LRCB4LnnAHiHhpH/2n
	PxluxUcmKP2D2CHUkyawpYBW76SiT81ww0FvzNJElW1fCBo7Cxmyzy/6gU1hpj02ya
	zqDN6DUZ0UY7kXfv5m9pQKaNOzKPCHUhmFzquI0/i2ZitDaTzDs0uUxw4dmEyfNEKB
	JO53+l8Fp5he8Uja76ATWmdq7I0ETiYJyl14KuXzMl2+A8fG71pcKLXBuiQj4SxAMF
	0QgAorrYSdPni2DTM5L98+4E=
Date: Fri, 15 Mar 2019 12:45:52 +0200
From: Adrian Bunk <bunk@stusta.de>
To: changqing.li@windriver.com
Message-ID: <20190315104552.GB14180@localhost>
References: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mdadm: fix gcc8 maybe-uninitialized/format-overflow warning
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
X-List-Received-Date: Fri, 15 Mar 2019 10:45:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 12, 2019 at 05:41:58PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
> it failed
> 
> [snip]
> | Incremental.c: In function 'Incremental_container':
> | Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> | close(mdfd);
> | ^~~~~~~~~~~
> 
> [snip]
> super-intel.c: In function 'apply_takeover_update':
> | super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
> | " MISSING_%d", du->index);
> | ^~
>...

I am seeing these warnings only with -Og, are you also seeing them with
-Og (DEBUG_OPTIMIZATION) only?

If this is true, I would consider 
https://sources.debian.org/src/mdadm/4.1-2/debian/patches/debian-no-Werror.diff/
a better workaround.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


