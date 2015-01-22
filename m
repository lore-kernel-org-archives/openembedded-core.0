Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id A3AF271637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:08:44 +0000 (UTC)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id F2A4D3F595
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:08:41 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:08:41 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:08:39 +0100 (CET)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 22 Jan 2015 15:10:01 +0100
Message-ID: <54C10465.9050504@topic.nl>
Date: Thu, 22 Jan 2015 15:08:37 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1421864706-26101-1-git-send-email-paul.gortmaker@windriver.com>
	<CACS+7ZSzfPxwYc1ksmzLk-f5dOuk_Ng4WC8BWy03ofnAx1UUmA@mail.gmail.com>
In-Reply-To: <CACS+7ZSzfPxwYc1ksmzLk-f5dOuk_Ng4WC8BWy03ofnAx1UUmA@mail.gmail.com>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [PATCH] base-files/profile: change EDITOR to not be busybox specific
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
X-List-Received-Date: Thu, 22 Jan 2015 14:08:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 21-01-15 20:29, Dan McGregor wrote:
> On 21 January 2015 at 12:25, Paul Gortmaker
> <paul.gortmaker@windriver.com> wrote:
>> Setting "EDITOR=3D/bin/vi" breaks on non-busybox systems, as
>> vim will populate /usr/bin/vi instead, and you get stuff like:
>>
>>    op3:~/poky/meta-builder$ git commit -s
>>    error: cannot run /bin/vi: No such file or directory
>>    error: unable to start editor '/bin/vi'
>>    Please supply the message using either -m or -F option.
>>    op3:~/poky/meta-builder$ which vi
>>    /usr/bin/vi
>>    op3:~/poky/meta-builder$
>>
>> Since we've already specified a proper path above in the profile,
>> we've no need to call out where in the path vi lives, and hence
>> this will work with busybox and a full vim install w/o busybox.
>>
>> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>> ---
>>   meta/recipes-core/base-files/base-files/profile | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/reci=
pes-core/base-files/base-files/profile
>> index 88ab8d877b0d..53c2680409dd 100644
>> --- a/meta/recipes-core/base-files/base-files/profile
>> +++ b/meta/recipes-core/base-files/base-files/profile
>> @@ -2,7 +2,7 @@
>>   # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
>>
>>   PATH=3D"/usr/local/bin:/usr/bin:/bin"
>> -EDITOR=3D"/bin/vi"                       # needed for packages like cro=
n
>> +EDITOR=3D"vi"                    # needed for packages like cron, git-c=
ommit
>>   test -z "$TERM" && TERM=3D"vt100"        # Basic terminal capab. For s=
creen etc.
>>
>>   if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
>
> While I agree with this change, arguably busybox should also be
> changed. Everywhere I look "vi" lives in /usr/bin. FreeBSD, NetBSD,
> Ubuntu, and Slackware all seem to put vi in /usr/bin.
>
> The same is true of getopt.
>
> What are other people's thoughs?
>

If I remember my history lessons correctly, the distinction between /bin an=
d=20
/usr/bin was that /bin will reside in the root mount, while /usr may mount=
=20
something else. Busybox seems to consider "vi" and "getopt" things that nee=
d=20
to be available at all times. Which is not a strange thought, it would be=20
frustrating to know that all you need to fix the system is to edit a file, =
but=20
you're stuck without editor when /usr can't be mounted for whatever reason.

On the other hand, if you have a busybox system, you can always run vi usin=
g=20
"/bin/busybox vi" and /bin/vi is just a symbolic link for that. If all othe=
r=20
systems use /usr/bin/vi, I think busybox should be changed to follow suit.

In the end, my vote would be on a busybox modification. I can't think of a=
=20
convincing reason why it should reside in /bin/, while there are plenty=20
reasons to move it to /usr/bin.


Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Visit us at Embedded World 2015 Nuernberg, 24.02.2015 till 26.02.2015, Hall=
 1, stand number 136.
https://www.embedded-world.de/de/ausstellerprodukte/?focus=3Dedb3exhibitor&=
focus2=3D14017667&focus3=3Dembwld15&highlight=3Dtopic


