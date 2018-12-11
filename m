Return-Path: <jandryuk@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id BE72E6C12C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 13:43:00 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id 83-v6so12986073ljf.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 05:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=11qpf+Cd/0Ei5QKEHvPrYuHAAm/iJxfD0PRIFfaRDrk=;
	b=GvNQchIeWVZahg4Gkqpt04JXT2BfzAlW4ta2+1bGFR02/19AxR4QBS1Q0So7TIykGP
	vxpVOd9SCMi+TwJm/kF+ExZ/4QUP/OWIC0KgtL9SCmIhT8XTKyso/9JFfFATFrFNQKlf
	vfw0rKhO2Mw3y5ocDRjHfVFRUbnsEbIaCodRAaUrR7/vlZZRmj9QQPmb+8lRvXOcysZu
	/q8Y9p8J6leJaR/xH5PdX+xfOylVhIDEBkvRZt6pzQE4+zOcorsd6/6u6tKkPNIA66wq
	Qj9Ec1vSbcggJZDhO423SVPByA4lit8fIz7SpCOp/wGDZPB2tEUQ/F/wuKYhduoCv5go
	GP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=11qpf+Cd/0Ei5QKEHvPrYuHAAm/iJxfD0PRIFfaRDrk=;
	b=TDV4uSkKy7MXx4XOnzTY/YUZsD1vsFFQa3nCJTPxMgsXJrpYPXCA3QKYFV1s+jEu9P
	L+brkDDVB8nRKyboOEfceVA80H0rfNJPHMprRNQtgsFSlmaQvyXL95P6oSilnrc75MGF
	4WszvRh6EpiKoJTKSVbt7DC+NUjxOrEDNpOWJcsWNgK6scM/jixI8CtoKwgfNycJ/Wem
	c2/51+J6cFN9cVMelVGQw8nPNmfS/3+MoqA7JFFzLAX6RglMyGN0Tf40ZXWURfeIV7Cg
	aHFxLPIxgyfrvACYcfa+R76J2VFRa/RTEZVqhDqmpu8vodmyeu3rl3NVBdd4P5WVRqiq
	IhNQ==
X-Gm-Message-State: AA+aEWZ1kAr2fNH1mHsME1JfPaHePvtexjdwhrr+9UgqqB3slNrsKw0c
	2ukndYZdA6WJk4qA2y+N3dQdajuINCOyh2RP0DxFSNwL
X-Google-Smtp-Source: AFSGD/Vdfdw5Kk/IC5u5I4+j4WfCdC7Jke+1BYVYaIEjK35ohazgHriI1ughBDPB0m5XKGyhIVCxJxRBVoE9XsfTk8E=
X-Received: by 2002:a2e:88cf:: with SMTP id
	a15-v6mr9549978ljk.76.1544535780928; 
	Tue, 11 Dec 2018 05:43:00 -0800 (PST)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 11 Dec 2018 08:42:48 -0500
Message-ID: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Tue, 11 Dec 2018 13:43:01 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Has anyone ever seen a generated shell script missing functions?

I have an OpenXT/OpenEmbedded setup where I had run many successful
builds.  I made a change and then re-ran the build - it failed in
binutil's do_install with autotools_do_install command not found.

core2-64-oe-linux/binutils/2.28-r0/temp/run.do_install.11776: line
124: autotools_do_install: command not found

Sure enough, autotools_do_install is not in run.do_install.

I had not changed binutils or any relevant variable, as far as I can
tell.  If I run with '-e' I see the full autotools_do_install
function in the output.  For some reason, the generated script wasn't
including autotools_do_install.

I tried binutils -c cleansstate, but that didn't work.  I tried
pruning the sstate-cache dir, but that didn't work.  I tried deleting
tmp-glibc and sstate-cache, but it had the same error when I rebuilt.

Modifying binutils do_install by adding a comment and `true` lets it builds.

I saw something similar one other time where the generated script was
missing a function.  I can't recall the details, but it was a
different package and MACHINE.

Any suggestions on debugging this?

Thanks,
Jason

