Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id B386460601
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 15:23:51 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id vb8so2949652obc.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 07:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=upPKd2w13CK9jOstWaTeuQfBFMZ/2Qbal+uRXmgr+vc=;
	b=jAc/EWoby0Bne/JF7Bew0EMSuXxvFm8ARg0mmp35f+eDF1/u0mLqnUpR9ofnvNzJR/
	PRGpvlktGPYjesX32z6ApKPCrZ3IZ3opODgNc5zj2kK+X7oBZaA27c57zBgXilallbOd
	/AEjfls3zx4MkkyvYSCOybE8rP+87l6qZ0I1Nb5mdO6IUe8ffhcijlgiylSLH64e27h7
	NySLW2bShUTHg9ghE15Rg0EjXoruyEa6c9hEtMLyX1XUfYHWveNX4ex96liXYejQ6yQx
	TZTOgd+E3MFxhlMfsG1wImQHCO9YF4fc3RjQh19SNssxXZJOcAZvA5ZP6nYH3Vp1YDeQ
	WWQg==
X-Gm-Message-State: ALoCoQkTF23a4Qexy3lwkdciqt4Vd5+BskEPC4fDzwnuMg+ZCZ24MTc4AcEMHPSGFeFzFan8XBLm
X-Received: by 10.182.108.229 with SMTP id hn5mr6794820obb.51.1417706632447;
	Thu, 04 Dec 2014 07:23:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.159.138 with HTTP; Thu, 4 Dec 2014 07:23:32 -0800 (PST)
In-Reply-To: <CAJTo0LYXOobX8Nnjy1KrQizBpUTZDdHLjDV0uLzrUGED1iKjoQ@mail.gmail.com>
References: <cover.1417466732.git.anibal.limon@linux.intel.com>
	<fef682ae2a0028af5d14a4cc82e83208c6a440aa.1417466734.git.anibal.limon@linux.intel.com>
	<CAJTo0LZ6b0SYW7GY5KZ+zC-UGx8+afDif9y5iGTumj7Yycjr_A@mail.gmail.com>
	<CAP71WjzrWaBs-q8i=4UwbMpzsMzOxePXOFAyCCxa0xckwX2pbw@mail.gmail.com>
	<CAJTo0LYXOobX8Nnjy1KrQizBpUTZDdHLjDV0uLzrUGED1iKjoQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 4 Dec 2014 16:23:32 +0100
Message-ID: <CAP71Wjyjw9xSbwDjzjdYUqTmNcb+W4yGUHtNmk924c1fYOKzmw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libdrm: Upgrade to 2.4.58.
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
X-List-Received-Date: Thu, 04 Dec 2014 15:23:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 4, 2014 at 3:40 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 4 December 2014 at 07:14, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> hmm. it worked for me, libdrm-doc was generated fine, and nothing
>> really has changed upstream in this area. my buildhistory shows that
>> libdrm-doc has:
>
>
> And my libdrm has no documentation, because it's checking for xsltproc and
> the docbook stylesheets, which I don't have installed..  You had
> dependencies, I don't, the autobuilder may have had transient failure or an
> incomplete set of build deps.  Either way, this should be an option as
> currently this isn't deterministic.  We need a packageconfig for manpages
> with xsltproc-native and the xslt stylesheets as build depends.

you're right.. i have xsltproc in my sysroot..

i didn't find any other package in -core where we really used a
PACKAGECONFIG for doc. so i would vote to simply do like we do in
every other packages, e.g.

--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -20,6 +20,7 @@ DEPENDS += " libpciaccess"
 inherit autotools pkgconfig

 EXTRA_OECONF += "--disable-cairo-tests \
+                 --disable-manpages \
                  --enable-omap-experimental-api \
                  --enable-freedreno-experimental-api \
                  --enable-install-test-programs \

With that change, I am getting:

==
--- a/packages/armv7at2hf-vfp-neon-oe-linux-gnueabi/libdrm/libdrm-doc/latest
+++ b/packages/armv7at2hf-vfp-neon-oe-linux-gnueabi/libdrm/libdrm-doc/latest
@@ -3,6 +3,6 @@ PR = r0
 RPROVIDES =
 RDEPENDS =
 RRECOMMENDS =
-PKGSIZE = 40390
+PKGSIZE = 0
 FILES = /usr/share/doc /usr/share/man /usr/share/info
/usr/share/gtk-doc /usr/share/gnome/help
-FILELIST = /usr/share/man/man3/drmAvailable.3
/usr/share/man/man3/drmHandleEvent.3 /usr/share/man/man3/drmModeG
+FILELIST =
==

By the way, this is not a new problem (sorry I know i reported it on
that thread ;-). This change for manpages was done in 2.4.42. So we
should not really block the update to 2.4.58, and if you agree on the
patch above, i can send it separately.

