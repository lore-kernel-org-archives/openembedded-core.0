Return-Path: <mike.looijmans@topic.nl>
Received: from smtp103.mer-nm.internl.net (smtp103.mer-nm.internl.net
	[217.149.192.139])
	by mail.openembedded.org (Postfix) with ESMTP id 85B3C7382E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 14:54:06 +0000 (UTC)
Received: from amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.54])
	by smtp103.mer-nm.internl.net (Postfix) with ESMTP id DDEA03F481
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 15:54:06 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en
Received: from smtp103.mer-nm.internl.net ([217.149.192.139])
	by amavisd-new (mailscanner08.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 15:54:06 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp103.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 15:54:06 +0100 (CET)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Mon, 2 Mar 2015 15:55:22 +0100
Message-ID: <54F4798C.8070402@topic.nl>
Date: Mon, 2 Mar 2015 15:54:04 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Building with OpenMP support in OE fails on #include <omp.h>
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
X-List-Received-Date: Mon, 02 Mar 2015 14:54:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFHere's the problem, running in a devshell:

# echo '#include <omp.h>' > /tmp/compileme.c
# $CC -c -fopenmp /tmp/compileme.c
/tmp/compileme.c:1:17: fatal error: omp.h: No such file or directory
  #include <omp.h>
                  ^
compilation terminated.


The #pragma's and linking of OpenMP work just fine, it's just the inclusion=
 of=20
omp.h that appears to fail.

What I was actually trying to do is to activate OpenMP in OpenCV to get dec=
ent=20
performance on a multicore ARM system. But this is holding me back now.

Looking in the sysroots reveals that the include file is actually there:

$ find tmp-glibc/sysroots/topic-miami-florida-med-xc7z030 -name omp.h
tmp-glibc/sysroots/topic-miami-florida-med-xc7z030/usr/lib/gcc/arm-oe-linux=
-gnueabi/4.9.1/include/omp.h


Maybe something missing in the OE compiler options for the compiler?


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

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


