Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 7545B77698
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 15:50:27 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u86FoMwi023461
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 17:50:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1473177024;
	bh=/1Uu1f2tKDSst8sVR3dbSJ8PQJx1SqZkPDxKuuE0o8U=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=KTGEEgUUcVTM1eY9jwgtO0fQ0+rA/rXegae1ergbhsg611qz+vTvKAin+2q851zPw
	D6A3xCE5gKRhOXAeJnpTkfmUNdOMm6IB/L6vtdQIUey7fTXU0+HnCILJSQEDA7dyqR
	IIctYPXotAWZpcQPl+2lN+SIiDGPp9slzPCld6bw=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u86Fo4QT018944 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 6 Sep 2016 17:50:04 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 6064AAD929F;
	Tue, 6 Sep 2016 17:49:33 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	u86Fo2OB018941
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org> from
	ensc@sigma-chemnitz.de; Tue, 6 Sep 2016 17:50:02 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.86_2) (envelope-from <ensc@sigma-chemnitz.de>) id 1bhIdO-000372-FI
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2016 17:50:02 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
	<d4044adfd000c8b67ed9b523bfbfc49ca97e8fa7.1473155977.git.paul.eggleton@linux.intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 06 Sep 2016 17:50:02 +0200
In-Reply-To: <d4044adfd000c8b67ed9b523bfbfc49ca97e8fa7.1473155977.git.paul.eggleton@linux.intel.com>
	(Paul Eggleton's message of "Tue, 6 Sep 2016 22:03:22 +1200")
Message-ID: <lywpipvxhx.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.0.95 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.8
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.78
Subject: Re: [PATCH 1/9] lib/oe/patch: handle non-UTF8 encoding when reading patches
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
X-List-Received-Date: Tue, 06 Sep 2016 15:50:29 -0000
Content-Type: text/plain

Paul Eggleton <paul.eggleton-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
writes:

> When extracting patches from a git repository with PATCHTOOL = "git" we
> cannot assume that all patches will be UTF-8 formatted, so as with other
> places in this module, try latin-1 if utf-8 fails.

This will probably not work when patch contains a character between 128
and 159 (which is a blackhole in all locales afaik).

I would read the file as a binary ('rb' instead of 'r') and make the
GitApplyTree.* strings a 'bytes' type.


Enrico

