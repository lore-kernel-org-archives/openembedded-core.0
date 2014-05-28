Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4BA6FB70
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:09:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4SN9fut030606; Thu, 29 May 2014 00:09:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CqGvERYflth1; Thu, 29 May 2014 00:09:41 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4SN9aLe030601
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 29 May 2014 00:09:37 +0100
Message-ID: <1401318568.2607.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 29 May 2014 00:09:28 +0100
In-Reply-To: <CACS+7ZSGKFG06F_jFOJZu7FJqLh2F+FgkW30PSMRQ8Xdio51Qw@mail.gmail.com>
References: <CACS+7ZSGKFG06F_jFOJZu7FJqLh2F+FgkW30PSMRQ8Xdio51Qw@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gzip: Avoid host contamination during build
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
X-List-Received-Date: Wed, 28 May 2014 23:09:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-05-27 at 17:38 -0600, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> On systems with /bin and /usr/bin merged the gzip recipe may find grep
> in /usr/bin, while OE puts it in /bin. Force the recipe to find grep in
> the correct place.
> 
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-extended/gzip/gzip.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-extended/gzip/gzip.inc
> b/meta/recipes-extended/gzip/gzip.inc
> index 920b256..57873cb 100644
> --- a/meta/recipes-extended/gzip/gzip.inc
> +++ b/meta/recipes-extended/gzip/gzip.inc
> @@ -12,6 +12,8 @@ SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz"
> 
>  inherit autotools texinfo
> 
> +EXTRA_OEMAKE = "GREP=${base_bindir}/grep"
> +
>  do_install_append () {
>   # Rename and move files into /bin (FHS), which is typical place for gzip
>   install -d ${D}${base_bindir}

My worry is what happens to gzip-native. Do we have to encode a path?

Cheers,

Richard


