Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1C96AF6D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 15:15:27 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id w16so4480545vbb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 08:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9gCaWfXEYO4tZBYxLsGeBPMUGeB8LoeF1bNC9rm39/M=;
	b=FX66l8p8Jv+eVslk11QFrPG2SuolawFjzcO3T5zzYA5NpwEigGBohrQGtQiHoGyZp8
	4fmLf3U941kjxFquxE/mCigmeLftf2kX7JnIAKS/4qt7UFTaWnpy1TGPfXgeo5BOHn/u
	4w9LI1JGi6Zk+VSiH/OvfqDmMPcD4PXqqWrnM4C7Vz19Z1nvj/bo3Gda8h6uW5arhyWH
	5rGFAEUs5yaAIu+AuONoNEN+BBFRd4wmAPGz/YlIWGM3w0iHv4r2Fuwr/ppip4m6/xYy
	RzOTpt65icymWqYxmbOdPYzkyMWpAE70K6g3FuW6YiVdz3J/cwirvBC/cAVYKsbfiRIf
	vzIA==
X-Received: by 10.52.18.196 with SMTP id y4mr6020978vdd.51.1373382928085; Tue,
	09 Jul 2013 08:15:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 9 Jul 2013 08:15:07 -0700 (PDT)
In-Reply-To: <1373290301-16657-1-git-send-email-net147@gmail.com>
References: <1373290301-16657-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2013 16:15:07 +0100
Message-ID: <CAJTo0LbqshnJ__S-zWNHqNHeG3YaddZXitKkoatqnFoKEMGr8g@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQn9GcxqIAY0J5Bb+m7CC/y3th5RnMWErLJQ1qJStIr61EEFgwBtVNLqZYsD+YQ4+Y7WqfGr
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] resolvconf: check if running systemd in postinst
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
X-List-Received-Date: Tue, 09 Jul 2013 15:15:27 -0000
Content-Type: text/plain; charset=UTF-8

On 8 July 2013 14:31, Jonathan Liu <net147@gmail.com> wrote:
> Check if running systemd in postinst by testing for existence of
> /sys/fs/cgroup/systemd instead of checking if systemd-tmpfiles
> exists in PATH. This is so populate-volatile.sh update is called
> instead of systemd-tmpfiles --create if the system has
> systemd-tmpfiles installed but was booted using sysvinit.

So this says to me that having two ways of creating files in volatile
locations is stupid.  Should we just split out populate-volatiles from
initscripts into it's own package so it can be used by pure systemd
images, and split out systemd-tmpfiles so it isn't enabled by default?
 This patch solves the issue for resolvconf but there are plenty of
other recipes that don't install files/postinst for both
populate-volatile and systemd-tmpfiles.

Ross

