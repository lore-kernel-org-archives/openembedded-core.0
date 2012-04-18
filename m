Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1SKXGA-0004xU-De
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:57:34 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q3IFm0aX024733
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 18 Apr 2012 17:48:01 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1SKX6u-00050N-Ag; Wed, 18 Apr 2012 17:48:00 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <cover.1334594354.git.paul.eggleton@linux.intel.com>
	<d019790ba99d06f2f520d26b0f0a862c77353645.1334594354.git.paul.eggleton@linux.intel.com>
Date: Wed, 18 Apr 2012 17:48:00 +0200
In-Reply-To: <d019790ba99d06f2f520d26b0f0a862c77353645.1334594354.git.paul.eggleton@linux.intel.com>
	(Paul Eggleton's message of "Mon, 16 Apr 2012 17:43:02 +0100")
Message-ID: <lypqb52g9b.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.4
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Paul Eggleton <paul.eggleton-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/1] perl: fix re-execution of patch/configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 15:57:34 -0000
Content-Type: text/plain; charset=us-ascii

Paul Eggleton <paul.eggleton-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
writes:

> -        for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1 -d ":"` ; do
> +        for foo in `grep -I --exclude="*.patch" --exclude="*.diff" --exclude="*.pod" --exclude="README*" -m1 "/usr/include/.*\.h" ${WORKDIR}/* -r -l` ${S}/utils/h2xs.PL ; do

It would be much better to replace the 'grep -r' by 'find -type f ... |
xargs grep'.  'grep -r' is very bad because:

* '-r' is not standardized

* it can return symlinks which might point to read-only locations
  (e.g. patches/config.sh* are such links).  'sed -i' on such files
  can make the build fail.


Enrico


