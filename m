Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by mx.groups.io with SMTP id smtpd.web11.18769.1592836223610669819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 07:30:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linutronix.de, ip: 193.142.43.55, mailfrom: torbenh@linutronix.de)
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
	(envelope-from <torbenh@linutronix.de>)
	id 1jnNSn-0002oV-KW
	for openembedded-core@lists.openembedded.org; Mon, 22 Jun 2020 16:30:21 +0200
Date: Mon, 22 Jun 2020 16:30:21 +0200
From: "Torben Hohn" <torbenh@linutronix.de>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] boost: Add upstream patch to fix build on depending projects
Message-ID: <20200622143021.GO7421@linutronix.de>
References: <161AE1D6F84D7089.27321@lists.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <161AE1D6F84D7089.27321@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit


please ignore.

i fatfingered git send-email 

On Mon, Jun 22, 2020 at 03:48:47PM +0200, Torben Hohn wrote:
> From: Andreas Müller <schnitzeltony@gmail.com>
> 
> KDE's krita failed with:
> | error: 'typedef void boost::static_visitor<void>::result_type' is inaccessible within this context
> 
> Note that only boost 0.173 is affected. 0.172 (dunfell) does not have this
> problem and the patch will be included in upcoming 0.174.
> 
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...l-rtree-visitors-insert-base-class-p.patch | 30 +++++++++++++++++++
>  meta/recipes-support/boost/boost_1.73.0.bb    |  1 +
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
> 
> diff --git a/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch b/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
> new file mode 100644
> index 0000000000..fb31823dd4
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
> @@ -0,0 +1,30 @@
> +From aafbceccc76dccb75963dd4f596fd1f10ee34b03 Mon Sep 17 00:00:00 2001
> +From: Jonathan Wakely <boost@kayari.org>
> +Date: Fri, 5 Jun 2020 19:29:27 +0100
> +Subject: [PATCH] Make index::detail::rtree::visitors::insert base class public
> +
> +Fixes #721
> +
> +Upstream-Status: Accepted [https://github.com/boostorg/geometry/commit/aafbceccc76dccb75963dd4f596fd1f10ee34b03]
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> +---
> + boost/geometry/index/detail/rtree/visitors/insert.hpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/boost/geometry/index/detail/rtree/visitors/insert.hpp b/boost/geometry/index/detail/rtree/visitors/insert.hpp
> +index 2d324cb7f..5709a930c 100644
> +--- a/boost/geometry/index/detail/rtree/visitors/insert.hpp
> ++++ b/boost/geometry/index/detail/rtree/visitors/insert.hpp
> +@@ -265,7 +265,7 @@ struct insert_traverse_data
> + // Default insert visitor
> + template <typename Element, typename MembersHolder>
> + class insert
> +-    : MembersHolder::visitor
> ++    : public MembersHolder::visitor
> + {
> + protected:
> +     typedef typename MembersHolder::box_type box_type;
> +-- 
> +2.26.2
> +
> diff --git a/meta/recipes-support/boost/boost_1.73.0.bb b/meta/recipes-support/boost/boost_1.73.0.bb
> index 5e9e0d87d7..995c14e8cc 100644
> --- a/meta/recipes-support/boost/boost_1.73.0.bb
> +++ b/meta/recipes-support/boost/boost_1.73.0.bb
> @@ -7,4 +7,5 @@ SRC_URI += "file://arm-intrinsics.patch \
>             file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
>             file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
>             file://0001-dont-setup-compiler-flags-m32-m64.patch \
> +           file://0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch \
>             "
> -- 
> 2.20.1
> 

> 


-- 
Torben Hohn
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 18; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/kontakt/Datenschutz.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Heinz Egger, Thomas Gleixner
