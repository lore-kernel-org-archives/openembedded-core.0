Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id EE8A660EFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 08:26:29 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id uz6so140167obc.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hmIwjRrijXi+X0LYiorsWDCvU77knkGg01m9+tC2wFc=;
	b=ie/T3hEZBWluquFcEm1NW+a2JBu27XDd8JoLYRhzYWfIcjiABAq7ImaakgchZPt2Pk
	C/+SlsuLFGrbQmIj8MjRWhri8mhhlQ8q1DHaTYa/pyay1rmmI7fe9J7kiicmdf6PFGw2
	k/HmLhM+nWIhmjf+TfRX4BBCRZAAbC/nbtX3H+uS1FGcQs+X+P+PBvdlasXCODeNx/IN
	Slf1Kz30tyKcXslCE+LXzbSTuQ7facGYIFuIARYk5yH4iyRpfat6aR0YHafBmTQ/65eB
	e/q2lMMcgIVtdYnM3hQAv8flOcEziap+A9nfmDAEAAV3zW7yPHcB8yc3O6Uv8ugk88/A
	2cIw==
X-Received: by 10.182.112.130 with SMTP id iq2mr634501obb.57.1395735989802;
	Tue, 25 Mar 2014 01:26:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.116.194 with HTTP; Tue, 25 Mar 2014 01:26:09 -0700 (PDT)
In-Reply-To: <1394724708-9894-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1394724708-9894-1-git-send-email-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 25 Mar 2014 09:26:09 +0100
Message-ID: <CAPybu_1Xx=eP8rZajNuA+SQ1Bs=TNiKqqtbWeXSSWbHiZpqdpA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] package_deb: Remove version from Provides Field
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
X-List-Received-Date: Tue, 25 Mar 2014 08:26:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ping

On Thu, Mar 13, 2014 at 4:31 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> According to Debian Policy Manual. Chapter 7.1
>
> All of the fields except for Provides may restrict their applicability
> to particular versions of each named package. This is done in
> parentheses after each individual package name; the parentheses should
> contain a relation from the list below followed by a version number, in
> the format described in Version, Section 5.6.12.
>
> This Fixes the following warning:
>
> root@qt5022:~# apt-get update
>
> ...
>
> Reading package lists... Done
> W: Ignoring Provides line with DepCompareOp for package
> pkgconfig__pkg-config__
> W: You may want to run apt-get update to correct these problems
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta/classes/package_deb.bbclass | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index 2d2f3f1..905af24 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -322,6 +322,13 @@ python do_package_deb () {
>
>          mapping_rename_hook(localdata)
>
> +        def debian_cmp_purgeversion(var):
> +            # dpkg does not allow versions on Provides.
> +            # From Debian Policy Manual, Chapter 7:
> +            # All of the fields except for Provides may restrict their applicability to particular versions of each named package.
> +            for key in var:
> +                var[key] = []
> +
>          def debian_cmp_remap(var):
>              # dpkg does not allow for '(' or ')' in a dependency name
>              # replace these instances with '__' and '__'
> @@ -359,6 +366,7 @@ python do_package_deb () {
>          debian_cmp_remap(rsuggests)
>          rprovides = bb.utils.explode_dep_versions2(localdata.getVar("RPROVIDES", True) or "")
>          debian_cmp_remap(rprovides)
> +        debian_cmp_purgeversion(rprovides)
>          rreplaces = bb.utils.explode_dep_versions2(localdata.getVar("RREPLACES", True) or "")
>          debian_cmp_remap(rreplaces)
>          rconflicts = bb.utils.explode_dep_versions2(localdata.getVar("RCONFLICTS", True) or "")
> --
> 1.9.0
>



-- 
Ricardo Ribalda

