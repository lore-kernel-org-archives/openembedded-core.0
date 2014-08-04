Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id D424C61585
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 15:35:54 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s74FZoQl007164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 17:35:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1407166553;
	bh=Qa4qmbsxIkI9gS6AKwrux7ESPN3CLtbT4InLJSOIiYM=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=BAZxbsOCXFGqT9cdPCUEX/wBIBdRs0csuLGqEtYtPKT2mfLLV32QSEnx8HLspOHxe
	kDYAsJaa5WpXRz/KXHk8NVZ98ZwXY7c5JjLuqq8oX6jDrOeR+QfWx2EiLTKKMP2Aha
	BJOxaMp0YEYM5Gzb6qwnT69kQ0GG2derFVJclI8U=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s74FZjMT011025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Aug 2014 17:35:47 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XEKIb-0008Rz-IQ
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Aug 2014 17:35:45 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 04 Aug 2014 17:35:45 +0200
In-Reply-To: <1407160628-30775-1-git-send-email-sujith.h@gmail.com> (Sujith
	H.'s message of "Mon, 4 Aug 2014 19:27:08 +0530")
Message-ID: <lyoaw09sj2.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Mon, 04 Aug 2014 15:36:02 -0000
Content-Type: text/plain

Sujith H <sujith.h-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> If hostname is not added to /etc/hosts file then rpcinfo command fails
> when hostname is passed as argument.
> ...
> root@mx6q:~# rpcinfo -s mx6q
> rpcinfo: can't contact rpcbind: RPC: (unknown error code)

Is this really a common/valid use case?  'rpcinfo' is a debug tool and
when you want information about the local host, you can execute

# rpcinfo -s localhost

IMHO, when using network related functionality, you have to setup
networking.  This means:

- setup the hostname; using ${MACHINE} is ambiguous with more than one
  device and the string can contain chars forbidden by DNS ('_')

- setup name resolving; this can be done by ordinary DNS, (unambiguous)
  /etc/hosts, mDNS


When DNS mapping of ${MACHINE} (or better `hostname`) without working
DNS is really required, 'systemd' contains 'libnss_myhostname.so' (which
is to be registered in /etc/nsswitch) which returns '127.0.0.2' as a
fallback.


Enrico

