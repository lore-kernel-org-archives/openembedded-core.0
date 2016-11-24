Return-Path: <prvs=013698ca26=mike.looijmans@topicproducts.com>
X-Greylist: delayed 1091 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Nov 2016 10:29:34 UTC
Received: from mx12-14.smtp.antispamcloud.com (mx12-14.smtp.antispamcloud.com
	[46.165.232.184])
	by mail.openembedded.org (Postfix) with ESMTP id A6832719DC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 10:29:34 +0000 (UTC)
Received: from [37.74.225.130] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx12.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.86) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1c9qyh-0005Pf-3x for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2016 11:11:20 +0100
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 24 Nov 2016 11:10:02 +0100
To: <openembedded-core@lists.openembedded.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <6df42b3b-66b7-25dc-faac-e26e19fefbfd@topic.nl>
Date: Thu, 24 Nov 2016 11:10:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Filter-ID: s0sct1PQhAABKnZB5plbIbbvfIHzQjPVmPLZeVYSu3xU9luQrU+8/8qthi+0Jd/W6KAUC/fjyuDn
	NXFr4uarw0hD9tOHsAupOgHE9PArDByM+/sFVMoIHnzxJpiwTwAmqWxCevbUegdCrqkn8BN/sbj/
	kr1uWvhVMCtfj6/xQtWU2yOX8PQJGjCrFTzGoLEGAwQOxc4FVEmxDKJstwBd0YGfRvAza+EhCQTN
	BNF2bc4ccBIk1Sag4dKiqCrF8eZZlyTbTpSJSkzczSD2RcFt/e/6EUxK+1ThVeXBHjTgRxsZI5tu
	cMJDAlvdmgaeJouJzXIF1zGGhkHhilg9snEzcImMn3HzupCKW6oeZkU58X31H/aAwarQpYDOYx/6
	JtUOwjf2M+bBLwNLnF2gf+AZ3cj9jBVCzdmhdpNvLM9EoHGCgFe8QCr3pk4nvBg39CKa3jR5NeVa
	JQBh0uawl0Cg8g5H75jeYRQu46K9FQfOtW179c3UTBg+eMlI+Ad+hOdu2jl82F+q3WD+2SUCv7Qo
	M7oSUn4IVvn2XtihDnFFPeASh5SHKlr9iAY0a+E99zzUIRFsicyJMEhQFtD8PLointZhy401wBd7
	DB89ILX39iXENXOV4w3ogceBFWVtR+kMcpcEF40xDLsgivxXInCFWYgSiYX2GrAnrzOM7HcmsBOn
	S9HUjFSJqqbImp9o8R6RMS+4ayUpOtEhdxekWDmK9g==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
X-Originating-IP: 37.74.225.130
X-SpamExperts-Domain: topic.nl
X-SpamExperts-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.04)
X-Classification: not-spam/combined
X-Recommended-Action: accept
Subject: Kernel: Builds use old version of defconfig
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
X-List-Received-Date: Thu, 24 Nov 2016 10:29:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI'm currently experiencing a problem with "defconfig" files and th=
e kernel.

In short, when I make a change to the "defconfig" file, the kernel is rebui=
lt=20
(which is correct), but the resulting kernel has been built using the old=20
defconfig from a previous build, instead of the new one.

The kernel recipe just contains "file://defconfig" in its SRC_URI. The=20
defconfig file is in the project's overlay.

For example, I have a kernel with "CONFIG_DEVMEM" disabled:

# gunzip < /proc/config.gz | grep DEVMEM
# CONFIG_DEVMEM is not set

Now, I change the defconfig to contain CONFIG_DEVMEM=3Dy and build the imag=
e.=20
The result:

# gunzip < /proc/config.gz | grep DEVMEM
# CONFIG_DEVMEM is not set

So the change did not make it into the actual kernel, even though the kerne=
l=20
was rebuild as a result of the change.

I run "bitbake -c cleansstate virtual/kernel" and build the image again:

# gunzip < /proc/config.gz | grep DEVMEM
CONFIG_DEVMEM=3Dy

After cleaning, the result is correct and the new defconfig is active.

I'm trying to figure out how this can happen, any help is welcome...


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail






