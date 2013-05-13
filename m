Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UbqfE-0004zp-F6
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 13:11:46 +0200
Received: by mail-ve0-f181.google.com with SMTP id d10so5521621vea.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 03:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=RKH4tG3ZO063VB5q67hC+y9i6VJ73jMfV4mhRxbD1qs=;
	b=Frd7+Hkakg0diLYC7/WvCIwEQ2G+AGx5ij45NMSo6gCTLpcptnQ3bmBey1eyZA4JQ2
	Y4eshC5uOyTk6sRBWp5bo7y1/0yoFHyzCjGf2zlBGaP04X1bcbUpLHy7yHWajtN27jP7
	zfBX5+KGTGhaO30qEeKopnynPCtV62CVZlf9CBExzAFZjvBb2Z3LABRv0qFVWwTYboFL
	IE1azvegb2+NbWjmPRxu7Z8AoHK42Mz3flytBjs/UnZBZlwzKPTcyFBxrvCY1i+8QLTV
	7Z/3a9wcCCr2YENDAD8X+lRcqzciqCT/r+uC98Fj34CqHjtDxbaYuen4S+NF0NbZzVeG
	NIFA==
X-Received: by 10.52.37.196 with SMTP id a4mr15412698vdk.82.1368442402601;
	Mon, 13 May 2013 03:53:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 03:53:02 -0700 (PDT)
In-Reply-To: <1368417521-9219-1-git-send-email-net147@gmail.com>
References: <1368417521-9219-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 11:53:02 +0100
Message-ID: <CAJTo0Las4vi+firZWYxq22uSrGUmeZTG8eQSX+cADXLFiV3D+w@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQm+npN/XIYUxqkO+3hVgWe1truo8HYdK/dvFpqLUpF1Iqnrq9g9DdR459/sbctQpNaR+NrW
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base-files: add /run to dirs755 for systemd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 11:12:17 -0000
Content-Type: text/plain; charset=UTF-8

On 13 May 2013 04:58, Jonathan Liu <net147@gmail.com> wrote:
> The /run directory needs to exist when using systemd otherwise startup
> fails with the following error:
> systemd[1]: Failed to mount /run: No such file or directory

This is a genuine bug, but I'm not convinced it is the whole fix.
What about non-systemd images?  /run is meant to be a tmpfs, which is
why udev installs a volatile link from /run to /var/run.  If we create
a directory in sysvinit cases, we'll also need to mount a tmpfs on it.

The FHS 3 draft specification actually ratifies /run[1] so we could
take this advantage to start cleaning up our volatile layout in /var.
Start by always creating /run in base-files, and always mounting it as
tmpfs in fstab for the non-systemd case.  Then we can symlink /var/run
to /run, /var/lock to /run/lock, and so on.

Ross

[1] http://www.linuxbase.org/betaspecs/fhs/fhs.html#runRuntimeVariableData


