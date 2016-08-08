Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Greylist: delayed 320 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 Aug 2016 17:47:42 UTC
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 81B6E771AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 17:47:41 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u78HgK82027981
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Aug 2016 19:42:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1470678140;
	bh=3GzOs8ud9qLuRcAzA7P5xK7+zk9o5q2jmZsTT68wxU8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Sender;
	b=YfxIf+1VgyNB4e925ruHEWTD2KMum2CWZjFhzW2ZQQBqkNb5iugaUh7eAZImhg1Fu
	MUFwl2KYxWd+bg8pn24tdYmmf6HVlLKc+6Js+ojPfWHVlEKtul4Ue6lUalOUujSrtM
	KodiARHDqD36SA5BGLnV68GMYbP4M+uUNofuq4EY=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u78Hg1m5030087 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 8 Aug 2016 19:42:03 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 503696EEFEF;
	Mon, 8 Aug 2016 19:41:21 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u78Hg0b6030084
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Mon, 8 Aug 2016 19:42:00 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>) id 1bWoYp-0004Ma-DM
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2016 19:42:00 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 08 Aug 2016 19:41:58 +0200
Message-ID: <lyzion6tuh.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -1.1
X-Spam-Level: -
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Subject: python3: use LC_CTYPE, not LC_ALL to set utf-8
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
X-List-Received-Date: Mon, 08 Aug 2016 17:47:43 -0000
Content-Type: text/plain

Hello,

due to python3's misdesigned string handling, recent bitbake/OE enforces
'LC_ALL=en_US.utf-8'.  This causes a lot of problems:

* programs are giving out unicode quotes; e.g. look at the filenames in

  | env LC_ALL=en_US.utf-8 install foo bar

  (it is assmed that 'foo' does not exist).

* every non-C locale seems to have a strange LC_COLLATE behavior:

  - it mixes upper and lowercas ('aword' < 'Bword' < 'cword')

  - it mixes dotfiles and non dotfiles ('aword' < '.bword' < 'cword')

* almost everything in the en_US locale is different from the rest of
  the world (letter vs A4 paper, 12h vs 24h clock format, sunday instead
  of monday starts week, lb vs. kg, inch vs. cm)


I suggest to set only 'LC_CTYPE=en_US.utf-8' and request perhaaps
explicitly a language neutral behavior by 'LANG=C'.

I have

| export LC_CTYPE = "en_US.utf-8"
| LC_ALL[unexport] = "1"     # overrides bitbake.conf setting; might be removed

in my distribution.conf after removing some sanity checks in bitbake and
OE.



Enrico

