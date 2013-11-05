Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 6B1E260B9B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 16:16:56 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	rA5GGsjm008365
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 5 Nov 2013 17:16:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1383668216;
	bh=iEB3xYRk+lk7MC9LEmT2e8FgsTpkC77fng32G9tVSZ4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=TRGBIugsC9QMWHa/QpnVue69GKDVDsc+YXCvCe7XF6u8+yYOLX+hmsWBnbkyUK1v0
	CdFhGuCk/p80JfSxoWml1Ag1uKt7a0FzOfTQcjDpwNWJljLcczpqHvoKH1lF4QI+9n
	9mcWxPV+b1AlfmnkkB92AnYKsTmyyEq6lXY5O5+k=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id rA5GGjQW013172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Nov 2013 17:16:47 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1VdjJ7-0007yF-O6; Tue, 05 Nov 2013 17:16:45 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1383663447.git.laurentiu.palcu@intel.com>
	<f61f1d9fc224cc017996769e23b08d0af13f3722.1383663447.git.laurentiu.palcu@intel.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Tue, 05 Nov 2013 17:16:45 +0100
In-Reply-To: <f61f1d9fc224cc017996769e23b08d0af13f3722.1383663447.git.laurentiu.palcu@intel.com>
	(Laurentiu Palcu's message of "Tue, 5 Nov 2013 16:58:05 +0200")
Message-ID: <ly38nau8lu.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.0
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Cc: Laurentiu Palcu <laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] flex: fix m4 issue on target
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
X-List-Received-Date: Tue, 05 Nov 2013 16:16:57 -0000
Content-Type: text/plain

Laurentiu Palcu
<laurentiu.palcu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> writes:

> Flex needs m4 to run (see below) and, since the create_wrapper
> introduces a bash dependency, export the right m4 path when /etc/profile
> is sourced by the shell.
>
> Snippet from the flex documentation:
> "The macro processor m4 must be installed wherever flex is installed.
> <...>
> m4 is only required at the time you run flex."

Content at profile.d/ won't be evaluated when program is started without
a shell (e.g. by 'execlp("flex", "flex", ...)').  


> [YOCTO #5329]

This should be solved by defining a correct path for the m4 binary at
build time.

EXTRA_OECONF += " ac_cv_path_M4=${M4}"
EXTRA_OEMAKE += " m4=${M4_class-native}"

is probably a better solution.



Enrico

