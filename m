Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 732BB60778
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 23:38:08 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4INc9bW009761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 01:38:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1495150689;
	bh=c6UCi3rdY7+IV9AYBKrDcdznCGL/ybjAkVxWlJy2LAo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=EoHlotveKS6NulTRBoLEkOz0rnNy7WCmtWtd7ENk9nA4wOTFX1F7FO7EW6NZeYwwX
	G/6cyQaMHk4YUFCX8te2HVeAP7eqwoJfPqTRfXFl2aIcrBJerPbbxIc5kRNlFx1ltR
	Atv9N5wyLEcmSa9rv8+xCmbAayUBTfPjwCJ1C/A4=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4INc1Dj024194 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Fri, 19 May 2017 01:38:02 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 226FBE6281F;
	Fri, 19 May 2017 01:35:40 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v4INbxcJ024189
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 19 May 2017 01:37:59 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1dBUzX-0000ip-Lf; Fri, 19 May 2017 01:37:59 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Denys Dmytriyenko <denis@denix.org>
References: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
	<20170518181957.GU28053@denix.org>
Date: Fri, 19 May 2017 01:37:59 +0200
In-Reply-To: <20170518181957.GU28053@denix.org> (Denys Dmytriyenko's message
	of "Thu, 18 May 2017 14:19:57 -0400")
Message-ID: <lyinkxrb1k.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Spam-Score: -0.6
X-Spam-Tests: AWL,BAYES_00,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL
X-Scanned-By: MIMEDefang 2.79
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tzcode-native: quote ${CC}
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
X-List-Received-Date: Thu, 18 May 2017 23:38:11 -0000
Content-Type: text/plain

Denys Dmytriyenko <denis@denix.org> writes:

>> -EXTRA_OEMAKE += "cc=${CC}"
>> +EXTRA_OEMAKE += "cc='${CC}'"
>
> Should these be double-quotes around ${CC}?

I wrote it in this way:

- to 60%, because '' is more correct than "" in this context (see below)

- to 40%, because "" would clutter code too much and I can not say
  whether it must be quoted as \", \\" or whether perhaps plain " works
  too


A yet more correct solution would be

| export cc = "${CC}"

in the recipe (outside of do_*()) and perhaps adding '-e' to EXTRA_OEMAKE.


This handles additionally the case when 'CC' contains a single quote
(which causes misbehavior in my patch).

Double quotes are much more worse because CC must not contain '$', '`'
or '\\' (which is not uncommon in flags like '-DFOO()=\"bar\"').  In OE,
it is not expected that these characters are interpreted directly by the
shell (${CC} is passed properly quoted in the environment).

But all this does not matter... correct quoting is neglactted in OE and
bitbake; when you are lucky, commands are written as "foo '%s'" % path.
But nobody uses functions like 'pipes.quote()' or a non-shell variants
like subprocess.call(['foo', path]).

So, you can assume that '${FOO}' expands to the same value like "${FOO}".


Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

