Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1U2llE-0005KB-K7
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:52:45 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r15GafMJ012554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 Feb 2013 17:36:42 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1U2lVh-0005S5-3t; Tue, 05 Feb 2013 17:36:41 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1360059615.git.dvhart@linux.intel.com>
	<41381da878685b601c62d446795c38119f08941b.1360059615.git.dvhart@linux.intel.com>
	<ly7gmn57tl.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<51113140.5050600@linux.intel.com>
Date: Tue, 05 Feb 2013 17:36:40 +0100
In-Reply-To: <51113140.5050600@linux.intel.com> (Darren Hart's message of
	"Tue, 05 Feb 2013 08:20:16 -0800")
Message-ID: <lytxpq4t0n.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.84
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Darren Hart <public-dvhart-VuQAYsv1563Yd54FQh9/CA@plane.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] oe-git-proxy.sh: Add a new comprehensive git proxy script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:52:45 -0000
Content-Type: text/plain

Darren Hart <dvhart@linux.intel.com> writes:

>>> +	$NC -X connect $*
>> 
>> why '$*' but not '"$@*"'?
>> 
> I'm not familiar with $@*

sorry... I meant "$@"


> As for $* versus $@, the issue is how the arguments are presented. $*
> as a single word, $@ each argument is quoted separately. I believe I
> ran into issues with $@. I haven't had any trouble with $*.

$* is causing trouble all the time because it does not retain whitespaces
or empty parameters.  There are only very few cases, where $* makes sense.


> Is there a particular use case where you can see this failing as is?

"$@" is just the right thing to do in this situation.  E.g. when your
script is called as

| oe-git-proxy.sh "${HOST}" "${PORT}"

and HOST is undefined due to some reason, you will try to connect to
"${PORT}" with $*.  The "$@" will cause nc to complain about the broken
HOST parameter.


Btw...

| exec $NC $METHOD "$@"

would be the school book implementation for the thing you want to do...



Enrico


