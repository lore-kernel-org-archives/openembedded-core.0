Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2966FF9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 17:28:03 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u82so3354516ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 10:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=20n2TD19/uC/8hvXmshrdcnbaUMQIkNoTWSGs5AXG+E=;
	b=h+ye7p2SpzpmMyvXa9NyZ7MNShlrlW2YeLhqAfrO/5xOtIjntKYBsmngHecvUQoRut
	0WfZQMLsxDmy0f7LJx+1Eese1cuRzfaWo4p7mD63hPaz2EOAgHuLmTYPm+sJgdBJYL5O
	c3GgVcrtOGmUTRzvlySoXWkgB2F5P3c9fHlVM4pGQGLHEkSDif5lLEgI3SLxplCZ4cHL
	YO3OP9FPqx8Re+N5/8hwAIF5XEBtyAZUObcas22iEbKLN7mcruCSGRkF56zbRDmp4dCL
	Aqu4MeXoRfPwcLqP8OaxTzWB5NlsRtn4deP1JmcleZ4wQitiVnJyEWS1cjsjv0Gs4YAN
	JqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=20n2TD19/uC/8hvXmshrdcnbaUMQIkNoTWSGs5AXG+E=;
	b=ANYQ38fH8+BXOicFGuBolhY3pSdGlMBAxS7Z3aZmx0jNh9TtTDq1zhluqVAVrpsEVh
	JRDUPAU1mgZ6zXrHH08pbcq6R3VNXv4LcCO0/2GpuUfMT9eZGY2Cp64sY7dOCC5h9aKW
	y0C71zUb4QTDC9QQAmJiWq6kOvAxr5+9rsJ2OWbSL4/epQwssi/6kQ0cXeFrxfUNpSzt
	Sv1AKHjyX+7t0HS+03pr59YkMffYTgjnGtswUzXlf46D6ukUeAiYGDtxMDVJ+YblaqiS
	0+OVXDsjfZHWyRBNcwyNr8/nBWyzuE09OWO/mLTABfS0PR34mqP4XNEMlelyijeCj3b+
	QKkQ==
X-Gm-Message-State: AE9vXwO/gQrlEq+OF7GDTGwB/C5n/HY7afAd2GuzIwKAM7cy79boUHkLmVqScOY//eJfE4VaT4ngG2UkRt5dhg==
X-Received: by 10.129.124.130 with SMTP id x124mr36989333ywc.101.1474478885407;
	Wed, 21 Sep 2016 10:28:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.80.33 with HTTP; Wed, 21 Sep 2016 10:27:34 -0700 (PDT)
In-Reply-To: <cover.1474444047.git.maciej.borzecki@rndity.com>
References: <cover.1474444047.git.maciej.borzecki@rndity.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Sep 2016 10:27:34 -0700
Message-ID: <CAMKF1spQ7YScCYyjD21qt6s0KU7L2rDi62+NW6vSYKduASVA6Q@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] systemd: use nss-resolve when systemd-resoveld is enable
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
X-List-Received-Date: Wed, 21 Sep 2016 17:28:04 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 21, 2016 at 1:19 AM, Maciej Borzecki
<maciej.borzecki@rndity.com> wrote:
> A patch series that enables use of nss-resolve (systemd's NSS service module) if
> systemd-networkd is enabled via PACKAGECONFIG.
>
> The first patch is a trivial formatting change.
>
> The second patch does the following:
>
> - replace dns with resolve in /etc/nsswitch.conf if systemd-resolved is enabled
>
> - applies a patch fixing the location of libnss_* services provided by systemd
>   (the patch has been submitted upstream for inclusion in v232)
>
> - applies a patch that fixes SERVFAIL handling, this restores the ability to
>   properly resolve names under qemu (backport from v231)
>
> Maciej Borzecki (2):
>   systemd: fix indentation
>   systemd: use nss-resolve by default if resolved is enabled
>


These changes look fine to me.

>  .../0023-nss-install-nss-modules-into-lib.patch    | 64 ++++++++++++++++++++++
>  ...en-processing-auxiliary-DNSSEC-transactio.patch | 49 +++++++++++++++++
>  meta/recipes-core/systemd/systemd_230.bb           | 22 ++++++--
>  3 files changed, 131 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-nss-install-nss-modules-into-lib.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0024-resolved-when-processing-auxiliary-DNSSEC-transactio.patch
>
> --
> 2.5.0
>

