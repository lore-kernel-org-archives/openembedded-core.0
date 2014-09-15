Return-Path: <mike.looijmans@topic.nl>
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by mail.openembedded.org (Postfix) with ESMTP id C40E97143F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 13:58:58 +0000 (UTC)
Received: from amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.128])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id 04A9D3F567
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 15:58:58 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-999 required=4.5
	tests=[BAYES_00=-2.9] autolearn=disabled
X-Spam-Languages: en sco rm
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 15:58:57 +0200 (CEST)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 15:58:57 +0200 (CEST)
Received: from [192.168.80.45] (192.168.80.45) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.181.6;
	Mon, 15 Sep 2014 15:59:10 +0200
Message-ID: <5416F0A0.80000@topic.nl>
Date: Mon, 15 Sep 2014 15:58:56 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1410536389.14624.1.camel@ted>
In-Reply-To: <1410536389.14624.1.camel@ted>
X-Originating-IP: [192.168.80.45]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [PATCH] license: Improve disk usage
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
X-List-Received-Date: Mon, 15 Sep 2014 13:58:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFI can probably come up with scenarios where "os.stat(src).st_dev =
=3D=3D=20
os.stat(destdir).st_dev" but os.link will still fail.

Less code and does not assume that when src and destdir are on the same=20
device, they can be linked:

try:
   os.link(src, dst)
except:
   shutil.copyfile(src, dst)

Mike.


On 09/12/2014 05:39 PM, Richard Purdie wrote:
> Currently copies of the license files are made which wastes disk space
> and adversely affects performance. We can link these instead in most
> cases for small performance gains.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 601f561..a34ea39 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -145,7 +145,14 @@ def copy_license_files(lic_files_paths, destdir):
>       bb.utils.mkdirhier(destdir)
>       for (basename, path) in lic_files_paths:
>           try:
> -            ret =3D shutil.copyfile(path, os.path.join(destdir, basename=
))
> +            src =3D path
> +            dst =3D os.path.join(destdir, basename)
> +            if os.path.exists(dst):
> +                os.remove(dst)
> +            if (os.stat(src).st_dev =3D=3D os.stat(destdir).st_dev):
> +                os.link(src, dst)
> +            else:
> +                shutil.copyfile(src, dst)
>           except Exception as e:
>               bb.warn("Could not copy license file %s: %s" % (basename, e=
))
>
>
>



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

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/


