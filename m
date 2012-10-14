Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TNL4A-0004r1-0n
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Oct 2012 12:05:02 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q9E9pfGG009641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 14 Oct 2012 11:51:42 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TNKrE-0000mf-TZ; Sun, 14 Oct 2012 11:51:41 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1350130322-3100-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANkPym+NSXqx6PrZnkhVqtsHoq-D20Dc14OgQ1Cq3G-bUQ@mail.gmail.com>
Date: Sun, 14 Oct 2012 11:51:40 +0200
In-Reply-To: <CABcZANkPym+NSXqx6PrZnkhVqtsHoq-D20Dc14OgQ1Cq3G-bUQ@mail.gmail.com>
	(Chris Larson's message of "Sat, 13 Oct 2012 18:46:56 -0700")
Message-ID: <lyvced8jpv.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -6.6
X-Spam-Level: ------
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: clarson@kergoth.com
Subject: Re: [PATCH] package.bbclass: search for dangling links in installation directory
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
X-List-Received-Date: Sun, 14 Oct 2012 10:05:02 -0000
Content-Type: text/plain

Chris Larson <clarson-ZYzTKstmaoRBDgjK7y7TUQ@public.gmane.org> writes:

>> +                # make path absolute; do not use os.path.join() here
>> +                # because target might start with multiple '/'
>> +                rtarget = inst_root + target
>
> I think you can use the join()

no; I used it in an earlier version of the patch

  rtarget = os.path.join(inst_root, target[1:])

and this fails for links like '//sbin/systemd'.  I could play around
with mangling 'target' through normpath() or lstrip()'ing the '/'.

But concatening the two paths is the best solution because I know that
'target' is absolute and starts with the dir delimiter.


Enrico


