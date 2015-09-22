Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 28AB073243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 22:32:43 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so44746681wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 15:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=SkpIOp8enJbz2XRK0Lq5KZDtP+n3SDlwmQyCfVmq3uo=;
	b=oJMQNRJTGc8xp4BlMQjPGDkMGUx+tCHbJkQrtJiiCMp351ZU+xa6nFPq5874W29ao1
	Ftx23uTPLkdowNoQpSwWUqTT/SxA+P1GdGeTYv0O/GHckD4g0NPGfxJ3z9yXjOqgkicu
	a9SeLFivXyf6jbDIzYbQolyjzdoSy3AWT1nSVwjb1cTaKjHQc+jZuZIyY6sM2ow8ptQc
	V3zYD10QP6W1Zqu+/caLS4oILg8OP1Fw5HnT95oVNOSJOOLm/53xnRsE9jLQXdUxOTZT
	Ewy5uAc1YIVmQfTQol+lIdVQqNPgXqMHiwCiEfcuUs96ZxwVFjH80iGA3u5liTs6SViO
	fMZw==
X-Received: by 10.194.87.74 with SMTP id v10mr30572965wjz.114.1442961163711;
	Tue, 22 Sep 2015 15:32:43 -0700 (PDT)
Received: from [192.168.0.7] (212-41-87-28.adsl.solnet.ch. [212.41.87.28])
	by smtp.gmail.com with ESMTPSA id 12sm4058659wjw.15.2015.09.22.15.32.42
	(version=TLS1_2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Sep 2015 15:32:43 -0700 (PDT)
Message-ID: <1442961161.18817.19.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Wed, 23 Sep 2015 00:32:41 +0200
In-Reply-To: <CALbNGRSYX_OkkNEXSZy9noKcgS8zEjiJxdABXOYMqbOk_zzKVw@mail.gmail.com>
References: <CALbNGRTZJYeAwLJteymkcTt7qjhG+3gq1RGk3HkG7DdXfSmzoA@mail.gmail.com>
	<CALbNGRQXjVqur0JbQ_4Kdrmwq+1HkZ3g-pghXdKKKpd6b-P=Vg@mail.gmail.com>
	<CALbNGRSYX_OkkNEXSZy9noKcgS8zEjiJxdABXOYMqbOk_zzKVw@mail.gmail.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: First run postinst broken
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
X-List-Received-Date: Tue, 22 Sep 2015 22:32:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Andreas
Am Sonntag, den 20.09.2015, 22:30 +0200 schrieb Andreas Müller:
> On Sun, Sep 20, 2015 at 8:56 PM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
> > On Sun, Sep 20, 2015 at 12:30 PM, Andreas Müller
> > <schnitzeltony@googlemail.com> wrote:
> >> Hi,
> >>
> >> on images build with current master the postinsts for first run on
> >> target are broken. Looking into
> >>
> >> 'meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service'
> >>
> >> I would expect
> >>
> >> '/etc/*-postinsts'
> >>
> >> in the image created for packets creating
> >>
> >>  '<package>.postinst returned 1, marking as unpacked only,
> >> configuration required on target.'
> >>
> >> in log.do_rootfs. I grepped around but could not find the place
> >> creating the files '/etc/*-postinsts'. Where are these files supposed
> >> to be created?
> >>
> >> Meanwhile I'll start a build with working configuration to find out
> >> where they are created...
> >>
> Sorry for spamming on this but it's important for me and kind of
> documentation. So:
> 
> For test I commented out
> 
> | ConditionPathExistsGlob=#SYSCONFDIR#/*-postinsts
> 
> from 'meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service'
> 
> And I see a postinstall.log again but the content does not make me happy:
> 
> | /usr/sbin/run-postinsts: line 76: opkg: command not found
> 
> Yes I forgot to say: I am using opkg - and it seems it did not make
> it's way in my image!
> 
> This seems to explain that directory /etc/ipk-postinsts is missing
> (and forget suspecting systemd -> previous mail).
> 
> Just a problem of opkg or are other package-managers missing on image either?
> 
> Andreas

I sort of having the same problem. I'm using opkg and angstrom.

I see in .../temp/log.do_rootfs
>>>
Installing angstrom-feed-configs (1.0-r16) on root.  
Downloading
file:.../deploy/ipk/colibri_imx6/angstrom-feed-configs_1.0-r16_colibri_imx6.ipk.
Removing package opkg from root...
<<<

Both opkg and angstrom-feed-configs bb files have:
RCONFLICTS_${PN} = "opkg-collateral"
RREPLACES_${PN} = "opkg-collateral"
RPROVIDES_${PN} = "opkg-collateral"

This has been the case also for opkg_0.2.4.bb (commit e8879cd1) but
somehow opkg_0.3.0.bb seems to have changed the reaction to that.

Commenting these in angstrom-feed-configs results in not removing opkg
in do_rootfs and the resulting image executes the postinstalls again.

If there are negative side effects (both opkg and angstrom-feed-configs
now install configuration files in /etc/opkg) I don't now yet. So I'm
unsure of the correct way forward.

Regards
Max



