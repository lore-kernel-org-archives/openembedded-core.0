Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1BC7F61AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 15:25:39 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id ox1so4890854veb.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2013 08:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Et7Hs2LEyMC1xqXDrSIzk/Yz/63AFz1WCThniEa5myc=;
	b=fepNAglUpXd0cI/IBfWM910PZH8KUBypDFAlJQMFdDfuDSSA/NZF7ETw5T6meBH1zk
	zDN4dfa6tLc1eq7XoFByROV7aMB+La8FXZLUUdNG+Fh19Wxe+jfI0pdDOFpTf6XfDDRN
	bEerOkr2r42H8mW/fSWPWlMLUCPJ4InCbMDiUbE1pLE17/VCctxj6HgSZOXryHL0r7e/
	gwZeqWaD2mO71x9TIWutcgfyzAR4eTX6tzi7d+0gq73KKs17AeuRfsD8YJ+PFC10WI0H
	xjjUrQo6VYzxpfLE/XrbdzSrYXJcs4GuE1MYmoGzQMUTSw2p9t4f3SKBmZ1fs4QzdItt
	1KCg==
X-Received: by 10.58.219.232 with SMTP id pr8mr11539699vec.80.1372778739976;
	Tue, 02 Jul 2013 08:25:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 2 Jul 2013 08:25:19 -0700 (PDT)
In-Reply-To: <b2b193d7632393d1a1ac091ce01eb9d93d44886b.1372686507.git.laurentiu.palcu@intel.com>
References: <cover.1372686507.git.laurentiu.palcu@intel.com>
	<b2b193d7632393d1a1ac091ce01eb9d93d44886b.1372686507.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jul 2013 16:25:19 +0100
Message-ID: <CAJTo0LZ=m=no=aiTcBqgGM_J0b5t429xkztCO1gkf-z2hC7UPg@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQnxGU4o5nCHstPJr1K6wBAGSOojzrkYH+7E1RKnETUWv74m0UOsURUgxKExgA/M+BGHwWoS
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Tue, 02 Jul 2013 15:25:39 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 14:57, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> +do_install() {
> +    # Only install file if it has a contents
> +    if [ -s ${S}/pointercal.xinput ]; then
> +        install -d ${D}${sysconfdir}/
> +        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
> +    fi
> +}

The file always has content because the file in the main recipe has a
comment in.  Personally I think not installing a useless file is the
right thing to do, so we should change the default pointercal.xinput
to be empty.

Relatedly, interestingly Weston has a different approach and attaches
the calibration to the device using udev properties, which means
systems where touch devices can be hotplugged actually work.  I'm
incredibly tempted to extend xinput-calibrator to write out udev
fragments and make Xi respect them if they exist...

> +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> +inherit autotools systemd

systemd?

> +RPROVIDES_${PN} += "${PN}-systemd"
> +RREPLACES_${PN} += "${PN}-systemd"
> +RCONFLICTS_${PN} += "${PN}-systemd"

It doesn't anymore, so these can be dropped.

Ross

