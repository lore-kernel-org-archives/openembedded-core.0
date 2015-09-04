Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id E82CC7701D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 06:42:57 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so13540357ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 23:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:organization
	:content-type:mime-version:content-transfer-encoding;
	bh=nVUSVgBxIi7az9TyCZrMLtri3PKnwqbgodAc/8FFggM=;
	b=SWWJKh7k6ESpzETx9nXmgRcFTU5rOiOavC3KDeh3p9ScyNmMxCpTGGs7hKQr+TckZ/
	QjE/WcTRIui95cIschry975jrKSilEh8ZlmLTvCgWB8tWxl8pdXRsTMbBAc8C6lurnj+
	XnI/rpoHtD/BxEUIlStqRY/upyr1wIyZyudbrJ+gwPf2kF/CnXerqbzviBGGYp2nw9SX
	XDrKrvTocS8wunEAJydQOB7qrxB+8oGovSm1UX6l/NKUBS/EPhqrB/GtOlVtT2ChCnpj
	UHS74VnM1DfdgWqW3dvy381YDHwoogGGr6qM5L5yiE8fwB/R3U+oPW1wju3qhJbSIUaB
	t7aA==
X-Gm-Message-State: ALoCoQkLh7C4k7FmfJr0kQo+2H/SpYD/Bu79busuWQF82bShT3vDqFuefh1k3wVMQSG/kqq63CE5
X-Received: by 10.107.41.76 with SMTP id p73mr3879978iop.58.1441348977376;
	Thu, 03 Sep 2015 23:42:57 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB6C.dip0.t-ipconnect.de. [93.232.251.108])
	by smtp.gmail.com with ESMTPSA id z65sm890022ioi.38.2015.09.03.23.42.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2015 23:42:56 -0700 (PDT)
Message-ID: <1441348974.9573.42.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Sep 2015 08:42:54 +0200
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: oe-init-build-env slowdown: chmod -R
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
X-List-Received-Date: Fri, 04 Sep 2015 06:43:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello!

The following commit introduced a "chmod -R -st" on the build dir:

commit f0d3587706fffdcc1c708013f6d6ce296dfc5f24
Author: Alex Franco <alejandro.franco@linux.intel.com>
Date:   Fri Aug 28 17:34:04 2015 -0500

    Fix mode +st on TMPDIR when creating it
    
    A sanity check fails when TMPDIR has setuid, setgid set. It was
    proposed to fix this on TMPDIR creation instead of failing with
    a sanity test only. This patch handles removal of those special
    bits (and additonally, the sticky bit) from BUILDDIR and TMPDIR
    when these directories are created.

In my case (*), that chmod takes about 2 minutes to complete. strace
shows that it does a fchmodat on all files, even if nothing needs to be
changed. atop then shows that this keeps the disk 100% busy with writes.
I don't know what gets written (can't be the access time, I tried
mounting with noatime).

Are others seeing the same behavior? I can't rule out that my disk is
just slow due to fragmentation.

The following commands work much better for me. I can submit a patch if
others see the same thing.

        find . -perm /+st -print0 | xargs -0 --no-run-if-empty chmod -st


(*) Debian 8, Linux 3.16.0-4-amd64, coreutils 8.23-4, ext4 on a SATA
hard disk.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




