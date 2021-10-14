Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686EFC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:42:36 +0000 (UTC)
Received: from avasout07.plus.net (avasout07.plus.net [84.93.230.235])
 by mx.groups.io with SMTP id smtpd.web10.703.1634229753059719905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=ccz0ZQEO;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.235, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id b3oImDctgdY2Sb3oKmJd6a; Thu, 14 Oct 2021 17:42:31 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=NP5OB3yg c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=8gfv0ekSlNoA:10 a=-An2I_7KAAAA:8 a=34IO7tiJ4IGA1gw_ibYA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=CjuIK1q_8ugA:10 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=I3nQCQ/uYYZEz/epXPeErqLHSvvcn+PV2LI9VO3m9rM=; b=ccz0Z
	QEOT0CO1tAFLXu/kuZaXRuZxSlMA2TGMjvchVEAt7hS+ciXijhTfH4PIr9GkkIrux/rTtS7It2/fG
	e3lv4tCXVXfBWrAWED91dFnCPDt8ZCNynNw5fyF5SDwl4MCRqSl1gEnM1CUPfK9AHJY3zHFvCw0Fe
	I8Hg/hq4QZYzREfA7xXcWZg07x5rruQxzCnsST4AKLSMibUfFcdf6yGEqimdwGsvNYE8EW4gaKQoY
	6nHoZ62tEJKwkKJHqNfykZZpPmJdmgXRhCTLo6bOCs26HjJ9KcT6E5Y/YV8PyJIiJX4VAFMAGv0fW
	OqUhw5BROTmBiU2ohXFhHjyZ7UjiQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mb3oI-003C8A-MW
	for openembedded-core@lists.openembedded.org; Thu, 14 Oct 2021 17:42:26 +0100
Date: Thu, 14 Oct 2021 17:42:26 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 2/2] license: Allow treating missing license as error
Message-ID: <YWhd8iAnlEd/XuR6@mcrowe.com>
References: <20211013104805.646626-1-mac@mcrowe.com>
 <20211013104805.646626-2-mac@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013104805.646626-2-mac@mcrowe.com>
X-CMAE-Envelope: 
 MS4wfBifRotrguL/WoLyKJO/RvzSjvkJW5jAtBNJVMUnSDGedYadnyZ+AyF4zigdwooio82gjshLg/uVSi0/KEFH5FajEKXwDngHdrOirfiKOb5d3YkSfyiq
 X8g60s2/8xQw8Qu94EXJyXX8EEu2r9KELBXRqaZDhmmCfWNww9bRVFbIxHCo8O4iNP7R4Ke/I4hIPg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 16:42:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156965

On Wednesday 13 October 2021 at 11:48:05 +0100, Mike Crowe wrote:
> Use the same WARN_WA and ERROR_QA variables as insane.bbclass to allow
> individual recipes, the distro or other configuration to determine
> whether a missing licence should be treated as a warning (as it is now)
> or as an error.
> 
> oe.qa.handle_error isn't immediately fatal, so track the overall sanity
> state and call bb.fatal if required at the end to ensure that the task
> really fails. If only bb.error is used then do_populate_lic isn't re-run
> on subsequent builds which could lead to the error being missed.
> 
> It seems odd for the license- error classes to be listed in
> insane.bbclass but implemented in license.bbclass. All recommendations
> for somewhere else to put them gratefully received.
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/classes/insane.bbclass  |  1 +
>  meta/classes/license.bbclass | 27 ++++++++++++++++++++-------
>  2 files changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 895216d3e8..57456c99ad 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -28,6 +28,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
>              invalid-packageconfig host-user-contaminated uppercase-pn patch-fuzz \
>              mime mime-xdg unlisted-pkg-lics unhandled-features-check \
>              missing-update-alternatives native-last missing-ptest \
> +            license-exists license-no-generic license-syntax license-format \
>              "
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 45d912741d..6bbb71392e 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -112,6 +112,7 @@ def find_license_files(d):
>      import oe.license
>      from collections import defaultdict, OrderedDict
>  
> +    sane = True
>      # All the license files for the package
>      lic_files = d.getVar('LIC_FILES_CHKSUM') or ""
>      pn = d.getVar('PN')
> @@ -146,6 +147,7 @@ def find_license_files(d):
>              self.generic_visit(node)
>  
>      def find_license(license_type):
> +        import oe.qa

There's a "sane = True" missing here.

>          try:
>              bb.utils.mkdirhier(gen_lic_dest)
>          except:
> @@ -178,7 +180,8 @@ def find_license_files(d):
>              # The user may attempt to use NO_GENERIC_LICENSE for a generic license which doesn't make sense
>              # and should not be allowed, warn the user in this case.
>              if d.getVarFlag('NO_GENERIC_LICENSE', license_type):
> -                bb.warn("%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type))
> +                sane &= oe.qa.handle_error("license-no-generic",
> +                    "%s: %s is a generic license, please don't use NO_GENERIC_LICENSE for it." % (pn, license_type), d)
>  
>          elif non_generic_lic and non_generic_lic in lic_chksums:
>              # if NO_GENERIC_LICENSE is set, we copy the license files from the fetched source
> @@ -190,7 +193,8 @@ def find_license_files(d):
>              # Add explicity avoid of CLOSED license because this isn't generic
>              if license_type != 'CLOSED':
>                  # And here is where we warn people that their licenses are lousy
> -                bb.warn("%s: No generic license file exists for: %s in any provider" % (pn, license_type))
> +                sane &= oe.qa.handle_error("license-exists",
> +                    "%s: No generic license file exists for: %s in any provider" % (pn, license_type), d)
>              pass

and a check for not sane missing here.

>  
>      if not generic_directory:
> @@ -215,7 +219,8 @@ def find_license_files(d):
>      except oe.license.InvalidLicense as exc:
>          bb.fatal('%s: %s' % (d.getVar('PF'), exc))
>      except SyntaxError:
> -        bb.warn("%s: Failed to parse it's LICENSE field." % (d.getVar('PF')))
> +        sane &= oe.qa.handle_error("license-syntax",
> +            "%s: Failed to parse it's LICENSE field." % (d.getVar('PF')), d)
>      # Add files from LIC_FILES_CHKSUM to list of license files
>      lic_chksum_paths = defaultdict(OrderedDict)
>      for path, data in sorted(lic_chksums.items()):
> @@ -233,6 +238,8 @@ def find_license_files(d):
>              for i, data in enumerate(files.values()):
>                  lic_files_paths.append(tuple(["%s.%d" % (basename, i)] + list(data)))
>  
> +    if not sane:
> +        bb.fatal("Fatal QA errors found, failing task.")
>      return lic_files_paths
>  
>  def return_spdx(d, license):
> @@ -398,6 +405,8 @@ def check_license_format(d):
>          Validate operators in LICENSES.
>          No spaces are allowed between LICENSES.
>      """
> +    import oe.qa
> +    sane = True
>      pn = d.getVar('PN')
>      licenses = d.getVar('LICENSE')
>      from oe.license import license_operator, license_operator_chars, license_pattern
> @@ -406,14 +415,18 @@ def check_license_format(d):
>      for pos, element in enumerate(elements):
>          if license_pattern.match(element):
>              if pos > 0 and license_pattern.match(elements[pos - 1]):
> -                bb.warn('%s: LICENSE value "%s" has an invalid format - license names ' \
> +                sane &= oe.qa.handle_error('license-format',
> +                        '%s: LICENSE value "%s" has an invalid format - license names ' \
>                          'must be separated by the following characters to indicate ' \
>                          'the license selection: %s' %
> -                        (pn, licenses, license_operator_chars))
> +                        (pn, licenses, license_operator_chars), d)
>          elif not license_operator.match(element):
> -            bb.warn('%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
> +            sane &= oe.qa.handle_error('license-format',
> +                    '%s: LICENSE value "%s" has an invalid separator "%s" that is not ' \
>                      'in the valid list of separators (%s)' %
> -                    (pn, licenses, element, license_operator_chars))
> +                    (pn, licenses, element, license_operator_chars), d)
> +    if not sane:
> +        bb.fatal("Fatal QA errors found, failing task.")
>  
>  SSTATETASKS += "do_populate_lic"
>  do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"

and license_image.bbclass probably needs the same treatment. Patch series v4 coming soon.

Mike.

