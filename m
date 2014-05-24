Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f48.google.com (unknown [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 87C366B3A4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 May 2014 14:44:34 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id k14so1814853wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 May 2014 07:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=HRwZDTHWxg9XXE5wfUfY/TW+0PytwiQ4ynzmWIhtKeA=;
	b=dBJ/TintlLDzO7kRAO+j+TAKAIipoHw70pFQdXmBvgl3P0Ad29d3iAUNwlKkPqN71x
	QrKZWdstkWbZqyfphV+aE8Wy0eQZehs+uLEq5fmTJSXWdxzOobgLqGJ7AvB4LBYtZSzi
	AJgWfgAwitFf5pS7v8BvYI7k2wIfSeK9FfjbyS7FPqtpp9c1ISHRl89RCEHn3+ebVLWY
	Uu0v0YmZshwcXUa5aQsMQPXkvfnrKZhq+ExMkrDgyjsgh95PovDW5BdiFUDJ1zuB2WQr
	k5MoslSk8bfRTOK5BZPjulP8C7pdXRfuMoPcdaOf0usLkNo6C6ayxOqVpPOPGEndIidh
	KpYw==
X-Gm-Message-State: ALoCoQk/kkjDRioTBaGatB5/WUSSDPrcojX9RVtmsPvHjQUU7/xwedyolzeyUKi7T4Cn3b9zyQeZ
X-Received: by 10.180.211.243 with SMTP id nf19mr11521441wic.58.1400942675444; 
	Sat, 24 May 2014 07:44:35 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	lo18sm10705254wic.1.2014.05.24.07.44.34 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 24 May 2014 07:44:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <113fcfb0c3c5533605e87538cd873c4ff90abcfc.1400815619.git.dvhart@linux.intel.com>
Date: Sat, 24 May 2014 16:44:31 +0200
Message-Id: <353D7623-F316-46C6-9F83-3D59DF30F7AD@dominion.thruhere.net>
References: <cover.1400815619.git.dvhart@linux.intel.com>
	<113fcfb0c3c5533605e87538cd873c4ff90abcfc.1400815619.git.dvhart@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ddimage: Support Mac OS
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
X-List-Received-Date: Sat, 24 May 2014 14:44:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mei 2014, om 06:28 heeft Darren Hart <dvhart@linux.intel.com> het =
volgende geschreven:

> Update the ddimage script to allow it to work on Mac OS too. The =
biggest
> difference is sysfs vs diskutil and in the syntax of the stat command
> between Mac OS and Linux, unfortunately. Workarounds using ls, cut, =
and
> columns got really fragile really quickly. Relying on stat and =
switching
> on uname seemed the more robust solution.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> ---
> scripts/contrib/ddimage | 25 ++++++++++++++++++++-----
> 1 file changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
> index 93ebeaf..b66d0dd 100755
> --- a/scripts/contrib/ddimage
> +++ b/scripts/contrib/ddimage
> @@ -1,7 +1,8 @@
> #!/bin/sh
>=20
> -#BLACKLIST_DEVICES=3D"/dev/sda /dev/sdb /dev/sdc /dev/sdd /dev/sde"
> -BLACKLIST_DEVICES=3D"/dev/sda"
> +# Default to avoiding the first two disks on typical Linux and Mac OS =
installs
> +# Better safe than sorry :-)
> +BLACKLIST_DEVICES=3D"/dev/sda /dev/sdb /dev/disk1 /dev/disk3"

s/disk3/disk2/


