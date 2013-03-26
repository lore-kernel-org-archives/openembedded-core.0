Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UKRZ8-0002RD-A6 for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 11:57:18 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UKRIg-00083p-MM; Tue, 26 Mar 2013 11:40:18 +0100
Message-ID: <1364294307.25692.146.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 26 Mar 2013 10:38:27 +0000
In-Reply-To: <5150C603.2010207@windriver.com>
References: <1364231993-31670-1-git-send-email-mark.hatle@windriver.com>
	<1364231993-31670-2-git-send-email-mark.hatle@windriver.com>
	<1364230955.25692.138.camel@phil-desktop.brightsign>
	<51508505.5080706@windriver.com>
	<1364233524.25692.139.camel@phil-desktop.brightsign>
	<5150A649.8090409@windriver.com> <5150C603.2010207@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 RFC] rpm: Add workaround for debugedit-segv
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
X-List-Received-Date: Tue, 26 Mar 2013 10:57:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-25 at 16:47 -0500, Mark Hatle wrote:
> I've looked at the code some more.  It does checksum the header itself and then 
> if it's got contents, it also adds the contents to the checksum.. That is where 
> the failure appears to be happening:
> 
>            if (u.shdr.sh_type != SHT_NOBITS)
>              {
>                Elf_Data *d = elf_rawdata (dso->scn[i], NULL);
>                if (d == NULL)
>                  goto bad;
>                process (d->d_buf, d->d_size);
>              }
> 
> So it's specifically checking for SHT_NOBITS, but it's matching so it falls 
> through and d->d_buf == 0, causing the failure.  I'll keep investigating, but 
> somehow that value (u.shdr.sh_type) is wrong [or at least unexpected!].

Ah.  If a NOBITS section is getting reported as something else then it
seems that this must clearly be a bug in libelf and ought to be fixed
there rather than working around it in rpm.  What do you actually get as
u.shdr.sh_type?

p.



