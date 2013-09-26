Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 9678B6B389
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 10:50:31 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r8QAoRIf028829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 12:50:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1380192631;
	bh=aBjohp7ldQHsQL/qcNv4FFEvJhAC49Hfo+fUw8VzkF4=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=V7pjm7P7q9atG2ccmREfphnkxiJ1wWpjFL1qH7mOj4etn17TcOcrWHSoIV9ssLjRX
	g19mg9FXEP5jfZ9dvp/g/19QN4s1gE52E8R7az+CyvsEtJzW2bzFJ00mmLnApUXG6n
	HfJX75nOjOWI3X6J8SNmwmHIG64WXpGO8LyylqC0=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r8QAoIpp023251
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 12:50:19 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VP99E-0001v4-Iw
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Sep 2013 12:50:17 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1380189657.git.Qi.Chen@windriver.com>
	<936abdfba1f8b3edf2f5dbfc6be803354798c4d2.1380189657.git.Qi.Chen@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 26 Sep 2013 12:50:16 +0200
In-Reply-To: <936abdfba1f8b3edf2f5dbfc6be803354798c4d2.1380189657.git.Qi.Chen@windriver.com>
	(Qi's message of "Thu, 26 Sep 2013 18:02:07 +0800")
Message-ID: <lymwmzhn6f.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.0
X-Spam-Level: ------
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [PATCH V2 1/1] sysvinit: fix missing of boot log
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
X-List-Received-Date: Thu, 26 Sep 2013 10:50:34 -0000
Content-Type: text/plain

<Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> Besides, we need to make sure that tmpfs has been mounted. Otherwise,
> the boot log will still be missing.
> ...
>  case "$ACTION" in
>  	start)
> +		mount -a -t tmpfs 2>/dev/null

This will mount filesystems out-of-order. E.g. it will break an /etc/fstab
with

| /dev/mmcblk0p1  /srv/www     ext4  default 1 1
| none            /srv/www/tmp tmpfs default 0 0


Enrico

