Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 2B67560DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 11:06:42 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s9GB6cUt029364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 13:06:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1413457601;
	bh=g7jE5KBKU0WR6EJ9fqCu0RHPRgSWdBa4EyMAR4VJ57c=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=Q9hp2LeFtIzJXBDYUy3hPWM4cn/6Ui4XWHAalu+kT4LdIh8ud9jsmz7ZTO0zNVwev
	E02MEg3QW850Ul0zkj8P/18j9Rwz5y+gh/9KIRPM/xDJGNir1XXdNxCrnfHnqoEdiB
	/zeOxxP0kLcFrToubPnr4Jh+dudwXOxphYNWEbNo=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s9GB6YNp025385
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 13:06:36 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1Xeit7-0006Qm-UC
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Oct 2014 13:06:34 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1413451107.git.Qi.Chen@windriver.com>
	<222ef849d28064ba0786fb5bf929554d6389c9cc.1413451107.git.Qi.Chen@windriver.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 16 Oct 2014 13:06:33 +0200
In-Reply-To: <222ef849d28064ba0786fb5bf929554d6389c9cc.1413451107.git.Qi.Chen@windriver.com>
	(Chen Qi's message of "Thu, 16 Oct 2014 17:19:04 +0800")
Message-ID: <lyr3y8z32e.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH 1/1] systemd: fix runtime dependency
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
X-List-Received-Date: Thu, 16 Oct 2014 11:06:44 -0000
Content-Type: text/plain

Chen Qi <Qi.Chen-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org> writes:

> Previously, if we set 'NO_RECOMMENDATIONS' to "1", we cannot reach login
> in systemd systems. 

IMO, this is just a configuration issue and can be fixed much better in
a higher level packagegroup recipe.  RRECOMMENDS for serial getty are
fine; although a serial console is very common on embedded systems, it
is not strictly necessary.


> This patch makes the following changes.
> 1. Add util-linux-agetty as a runtime dependency.
>    Otherwise, getty services in systemd cannot start correctly.

afais, it would make more sense to move this dependency into
systemd-serialgetty (and not systemd as in your patch). Or are there
other units in systemd which call agetty?


Enrico

