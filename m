Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 1570E6D8AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 11:04:53 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rACB4pib017108
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 12 Nov 2013 12:04:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1384254293;
	bh=7XCD/Qc7WMO0gaghkDVJTFkBvm+jJUyZWlhcrEOEXYU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=IE6//FQf6Xzk3g1fdno3pFLeyS+QPTqgPmWH1u+kOLLP0RiK7S/yaThRplUZKUyDp
	KjOMlNcPcHcKNhhn8BQhobetb0LRDbk+B4U4r/ob93z82Gx/V5Vhx+5+bg0/ppwVWV
	WwD18AEqAznFrCD7DqLK08EbOF1/enw9YdS9ITmo=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rACB4m8A021366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 12 Nov 2013 12:04:48 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VgBm3-0001bA-T2; Tue, 12 Nov 2013 12:04:47 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
	<1384245243-20247-3-git-send-email-tobias.henkel@oss.bmw-carit.de>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 12 Nov 2013 12:04:47 +0100
In-Reply-To: <1384245243-20247-3-git-send-email-tobias.henkel@oss.bmw-carit.de>
	(Tobias Henkel's message of "Tue, 12 Nov 2013 09:33:56 +0100")
Message-ID: <lyd2m5ubhs.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Cc: Tobias Henkel <tobias.henkel-98C5kh4wR6ohFhg+JK9F0w@public.gmane.org>
Subject: Re: [PATCH 2/9] icecc: Remove output on stderr when calling which
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
X-List-Received-Date: Tue, 12 Nov 2013 11:04:55 -0000
Content-Type: text/plain

Tobias Henkel <tobias.henkel-Y0tyK2LzuKvpgbXj0Ix11Q@public.gmane.org>
writes:

> -    return d.getVar('ICECC_PATH') or os.popen("which icecc").read()[:-1]
> +    return d.getVar('ICECC_PATH') or os.popen("which icecc 2> /dev/null").read()[:-1]
                                        ~~~~~~~~~~~~~~~~~~~~~~

I think, this can/should be replaced by

  bb.utils.which(os.getenv("PATH"), "icecc")

Ditto the other locations.


Enrico

