Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id F136B6EB24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 12:51:25 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id i8so17469191qcq.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 04:51:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LgeXfXeEyPPcETljH5ZOdiMKqICEE25yyDLpqa5sCY0=;
	b=FsXB+QasiYLhVzLveHgEN8M2LNbkQecbCcWi1AMKBC2RYNqrSbBXskzOG5GKuHdiqs
	60R7FqQQiy8QntS7Kb/wS+FADAl6sLx0VoRmE/W49gLq4MX+JYrP09M00QFDyzU/jlbL
	yyO8X4/iggHNJ0lpDVH+ABV1kAWXsrUIw5tagLTt/7TSgcQetmFhkOA0hP6J+3NtSO0O
	QTqou0JkiptNETCy+Um76U7umr9VtmVQIRZFRJDhOhN31h6MlVajcNT7vgAKQR2wlNfg
	/BD4nzkNtYLtM0DrBMyLIjlMM5oXE2Mm4BO//A6+F4C5zJq0PhpLNxE+HD4dsdkwpXXM
	+RQA==
X-Gm-Message-State: ALoCoQnJc/xWrzva10mOz45L4x7KzPZE5Pxpilm1TU0udHejx6A2MwkrDG6+OTfKj5zLVzWLKcZV
X-Received: by 10.224.45.197 with SMTP id g5mr2160527qaf.52.1392295886059;
	Thu, 13 Feb 2014 04:51:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 13 Feb 2014 04:51:05 -0800 (PST)
In-Reply-To: <7394b4a34e973a1655132709c054a272cf367252.1392276667.git.Qi.Chen@windriver.com>
References: <cover.1392276667.git.Qi.Chen@windriver.com>
	<7394b4a34e973a1655132709c054a272cf367252.1392276667.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Feb 2014 12:51:05 +0000
Message-ID: <CAJTo0LYt7ZpqiNnSa+gNPthXFDtZ=jLvajO6ZoSbXQvA0u4KzQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] alsa-state: do not install the init script in case of systemd
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
X-List-Received-Date: Thu, 13 Feb 2014 12:51:26 -0000
Content-Type: text/plain; charset=UTF-8

On 13 February 2014 07:32, Chen Qi <Qi.Chen@windriver.com> wrote:
> As the corresponding service files have already been provided by
> the alsa-utils-alsactl package, the init script is really not needed.
> So we do not install it in a systemd based image.

Remember that the presence of the systemd DISTRO_FEATURE doesn't mean
that systemd is actually being used: the distro could have systemd and
sysvinit features, and the choice of init system is decided at image
time.  In this case if a distro was using sysvinit and systemd, your
patch has just deleted the init scripts that are required for sysvinit
boots.

For every situation where there is both a service file and an init
file you must always remember that it's possible that both are to be
installed.  To avoid systemd invoking both the systemd unit and the
sysvinit script on boot it's best to ensure they have the same name
(systemd will then ignore the init script).  If that's not possible
then you can use "systemctl mask" in a postinst to hide the init
script from systemd.  There's plenty of examples for this in oe-core.

Ross

