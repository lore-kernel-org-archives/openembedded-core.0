Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id B08A86D320
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 15:09:07 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rA7F94GG002786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 7 Nov 2013 16:09:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1383836946;
	bh=petU/cZxRhmo+DX9FZRx4Qh2nroulsXS4fqUlGUeIYU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=cZeDjkrherYRUz2Z1/ZS4Rqgh/MS3IAQDXfIuZexTzjfWo3H9khx8ldphdcGTcgEy
	jXg04yFrjfxeiaH6HLnikETnQ5vYHfKBC01JHVL+3Ezw63vALnowhJ/zBZKlWjPdPF
	ak2QAMvfkgPblwNi89CKvswYDv62Bhj4V6EjZ5iw=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rA7F8mFN007739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 7 Nov 2013 16:08:50 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VeRCR-0006N0-93; Thu, 07 Nov 2013 16:08:47 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1383182680-20871-1-git-send-email-xufeng.zhang@windriver.com>
	<20131031082625.GE32015@jama>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 07 Nov 2013 16:08:46 +0100
In-Reply-To: <20131031082625.GE32015@jama> (Martin Jansa's message of "Thu, 31
	Oct 2013 09:26:25 +0100")
Message-ID: <lyob5wb669.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -3.9
X-Spam-Level: ---
X-Spam-Tests: AWL,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] kernel.bbclass: Delay rm_work to run after do_bundle_initramfs
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
X-List-Received-Date: Thu, 07 Nov 2013 15:09:08 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
writes:

> Why not add "before" param to addtask?
>
> addtask bundle_initramfs after do_compile before do_build
>
> could do the trick

no; due to

  do_bundle_initramfs[nostamp] = "1"

a (non-initramfs) kernel will be rebuilt everytime although nothing has
been changed.  The initramfs related tasks should be executed only when
an initramfs is really used.


Enrico

