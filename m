Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8F860196
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 13:54:41 +0000 (UTC)
Received: from amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.96])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 7A72C3F8BF;
	Tue,  3 Jun 2014 15:54:41 +0200 (CEST)
X-Spam-scanned: scanned by InterNLnet Mail Scan System
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=no
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner03.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP; Tue,  3 Jun 2014 15:54:40 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS;
	Tue,  3 Jun 2014 15:54:40 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Tue, 3 Jun 2014 15:54:45 +0200
Message-ID: <538DD39F.1080701@topic.nl>
Date: Tue, 3 Jun 2014 15:54:39 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <53843793.3030309@topic.nl>		<CAMKF1sr1vGQf8WSvbeXE5SufAaDivpn7czr5EL-VWKhw9_drBg@mail.gmail.com>		<CABcZANm0dkCh1zFysD6VjDLS-ijHGqNat=FRVTYf03SeUF4XDQ@mail.gmail.com>		<1401318733.2607.71.camel@ted>
	<538D5C34.4060905@topic.nl>	 <538D5E8C.1090008@topic.nl>
	<1401785145.12440.51.camel@ted>
In-Reply-To: <1401785145.12440.51.camel@ted>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to find out why shared sstate is not being used for a recipe
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
X-List-Received-Date: Tue, 03 Jun 2014 13:54:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 06/03/2014 10:45 AM, Richard Purdie wrote:
> On Tue, 2014-06-03 at 07:35 +0200, Mike Looijmans wrote:
>> =EF=BB=BFOn 06/03/2014 07:25 AM, Mike Looijmans wrote:
>>>> Worst case, you can pull the siginfo files from one build and the
>>>> siginfo files from the sstate mirror and then see which ones are
>>>> different, then run bitbake-diffsigs X Y to compare the two files.
>>>
>>> How do I find what to pull? I have (ssh) access to both machines. The
>>> sstate-cache dir contains a bunch of two-digit directories and a gazill=
ion files.
>>>
>>> I could just copy the whole thing to one machine, there's gigabit betwe=
en
>>> them, but then what do I do with these files?
>>
>> mike:~/zynq_platform/build$ find sstate-cache -name
>> '*fpga-image-miami*.siginfo' | wc -l
>> 480
>>
>> Suppose I copy them. Where do I copy them to, and what do I do with thes=
e 480
>> files to tell me why the system insists on rebuilding this package?
>>
>> Mike.
>>
>> PS: I really really want to find out. Several of these FPGA recipes take=
 3.5
>> hours to build on the fastest i5 we could buy. So you can imagine we rea=
lly
>> want to prevent having to build it more than once.
>
> Let me explain the manual process you can follow for this. Its a pain to
> walk through and its what -S attempts to automate but you should be able
> to get an answer manually this way.
>
> You have BUILDA and BUILDB, the two builds which should be reusing
> sstate but are not. The fact they're on different machines is irrelevant
> to this procedure. It would help if these two builds are just the result
> of "bitbake fpga-image-miami" but that isn't essential, it will just
> introduce more noise. It will also help if they are either both built
> from an existing sstate cache or both not.
>
> The first thing I'd do in each build:
>
> "find tmp/stamps/ -type f | sort > stamplistA.txt"
>
> I'd then so something like:
>
> "meld stamplistA stamplistB"
>
> the next steps depend upon how clear the differences are. Basically
> there should be some degree of commonality between the two builds and at
> some point there will be divergence. We need to pinpoint the point of
> divergence. The divergence will be in fpga-image-miami itself or in one
> of its dependencies.

ALL stamps for ALL tasks for fpga-image-miami are different. There's a few=
=20
thousand lines in these files, with very few similarities.

> The one thing which can confuse this view is if some things were reused
> from sstate. You can tell since a task which runs looks like:
>
> tmp/stamps/i586-poky-linux/x11-common/0.1-r47.do_populate_sysroot.d90d440=
4368125acd109a2ac64ca688f.qemux86
>
> and a task which is from sstate looks like:
>
> tmp/stamps/all-poky-linux/gstreamer1.0-meta-base/1.0-r0.do_populate_sysro=
ot_setscene.a49fa811727c557c14ab6ce6f2973587.qemux86
>
> The "_setscene" part tells you this. Machine specific tasks have the
> machine name appended to them ".qemux86" in this case. The hash
> representing the task is clear in the filename
> ("a49fa811727c557c14ab6ce6f2973587" in this case").
>
> You'll have to filter out any "noise" from these changes you're not
> interested in. If a task is "_setscene" its dependencies may be missing
> from the list of files entirely (no install/compile/configure etc.).
>
> So you take a guess at the divergence point and take note of the two
> different hashes. You can then find the corresponding siginfo files in
> sstate:
>
> find sstate-cache/ -name *d90d4404368125acd109a2ac64ca688f*
> sstate-cache/d9/sstate:x11-common:i586-poky-linux:0.1:r47:i586:3:d90d4404=
368125acd109a2ac64ca688f_populate_sysroot.tgz
=20
sstate-cache/d9/sstate:x11-common:i586-poky-linux:0.1:r47:i586:3:d90d440436=
8125acd109a2ac64ca688f_populate_sysroot.tgz.siginfo

I'll just go for the "do_fetch" task then, since that's about the first to=
=20
execute.

> which are the sstate files corresponding to my above x11-common task.
> You will note that the first two letters of the hash are used as a
> directory prefix. You can also find sigdata files in the stamp
> directory:
>
> $ find tmp/stamps/ -type f | grep d90d440
> tmp/stamps/i586-poky-linux/x11-common/0.1-r47.do_populate_sysroot.d90d440=
4368125acd109a2ac64ca688f.qemux86
> tmp/stamps/i586-poky-linux/x11-common/0.1-r47.do_populate_sysroot.sigdata=
.d90d4404368125acd109a2ac64ca688f
>
> The sigdata and siginfo files are identical and equivalent. Once you
> have the two sstate files, you can run:
>
> bitbake-diffsigs A.siginfo B.siginfo
>
> and this will tell you why their hashes are different. If you need help
> deciphering that output, link to it and I can help.
>
> If you didn't guess the divergence point correctly, it will tell you
> that some prior task is actually different. In that case you would then
> go and fetch the siginfo tasks for the previous task and compare those.
> Either you find the difference or again, you have to trace it further
> back.
>
> Its a pain of a process to go through but it is deterministic and you
> will eventually find the difference. Have a go and if you have any
> issues let me know and I'll do what I can to help.
>

Thank you very much!

So far, on one project (that is, NOT the fpga-image-miami) the SRC_URI is=20
slightly different. The machines are on various sides of a router/firewall,=
 so=20
SRC_URI=3D"git://${MY_SERVER}/blabla" evaluates differently.

How can I tell the system that the value of "MY_SERVER" is irrelevant to ea=
ch=20
and every build step in each and every recipe?


I'm still digging into the fpga recipes, but that's rather slow because eac=
h=20
build takes about an hour, and that's for the "fast" ones.

Mike.


Met vriendelijke groet / kind regards,

Mike Looijmans

TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Visit us at MEDTEC Europe 3-5 June, Messe Stuttgart, stand number 5D20
http://medteceurope.com/index.php?page=3Dhome-en


