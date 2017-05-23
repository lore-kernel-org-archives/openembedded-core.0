Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id DE2A877E88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 15:51:00 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4NFoxrc016428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 17:51:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1495554660;
	bh=/oiVzU/SyJYwX/KPHsXS0Q4WR0kglCc34UbsOgKwAPg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Sender;
	b=eYekIkNKpjr159XvLmKh5Hark82kdLL5Ob0UNyYzODaayNxhlfWJFp8yPmKlrvkiH
	8NhRRMJKwycAuZpJFAtJVwjRpQrUHNfD+Y25lAW2jQg2omzPA+ib5nP9eDHDK4zSxe
	GNFLrTl+O3Zd1/q+Z2BcL9IBxGXmBYrT4w1zIcjE=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4NForWq007263 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 23 May 2017 17:50:53 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 26E6EE73FC;
	Tue, 23 May 2017 17:48:24 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4NFooAC007260
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Tue, 23 May 2017 17:50:50 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>) id 1dDC5C-0002jV-ON
	for openembedded-core@lists.openembedded.org;
	Tue, 23 May 2017 17:50:50 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 23 May 2017 17:50:50 +0200
Message-ID: <ly4lwbfu79.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.76
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Subject: Per-recipe sysroot + BBCLASSEXTEND=cross
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
X-List-Received-Date: Tue, 23 May 2017 15:51:02 -0000
Content-Type: text/plain

Hello,

when having

--- test-a.bb ---
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"

BBCLASSEXTEND = "cross"

do_install_forcevariable() {
    install -d ${D}
    touch ${D}/foo
}
----

and

--- test-b.bb ---
LICENSE = "GPLv3"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"

DEPENDS = "test-a-cross"
----

the sysroot of 'test-b' will not contain the files from 'test-a-cross'
because the manifest could not be found:

| $ ./bitbake test-b
| WARNING: test-b-1.0-r0 do_prepare_recipe_sysroot: Manifest ... manifest-allarch-test-a-cross.populate_sysroot not found?
| ...

The sysroot code expects to find '-cross-' in the PN, so I changed
test-a.bb to contain

---
python () {
    override = d.getVar("CLASSOVERRIDE", True) or ""
    if override == "class-cross":
        d.appendVar("PN", "-${TARGET_ARCH}")
        d.setVar("SPECIAL_PKGSUFFIX", "-cross-${TARGET_ARCH}")
}
---


Is there a better way to use BBCLASSEXTEND to build cross recipes?


Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz


