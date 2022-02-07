Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E31C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 20:59:59 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.2113.1644267599228648209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 12:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mkm+4rSr;
 spf=pass (domain: konsulko.com, ip: 209.85.222.178,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f178.google.com with SMTP id o12so12073818qke.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 12:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=S2HAuttJB3b52S0FA2laiCJpaWJMTD+It+BS5Fo3lw8=;
        b=mkm+4rSrzquXsuW1+0pCkhTXAy2hnJcp4pkteursFx2H7YU2p/3YghEEs2vJcz/KvV
         KAJTMDFG05d9v7d8SqrbgsyXYBg6T6NPD40NLdl2Ckt0/V/FVYuHJX0P6NgPmKDQOcqT
         /WorxcpIH6gDzQqYhqMkwvErFLxyLax6iQ8gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=S2HAuttJB3b52S0FA2laiCJpaWJMTD+It+BS5Fo3lw8=;
        b=inZQGX01aszzk9Rl97pz0Z9T7yv3Sg7THjarw6hUT3oN/TCaAgJOS8VggsEn+9hcwx
         HLnspxOebZ5NIGcQOOwEchuLbd6cKMbQI7UoDgl7tWAFpFE5QMmJZQS+XfFg7t4vSTri
         t6AMYbJWZRgtT8sU0DwnMvmCwKNODFxgz51e7RZRHSq25olOhO0ty7m8xreLHNejlogl
         oFFrgjLhR/TwfCUDYDzPwtfLbIp+YE4QO76aLpkRAAZRH6yFzYKcz6wQxNonSxCA3t46
         TRoaeI6ccinZyf33vBpt/v6CSr1+9h4n7Sqo9JGF7vHGiAA3y6mGnoZ831YtkDFNWUka
         2wtQ==
X-Gm-Message-State: AOAM532Jm2+fjiV+xuvOHtmqxG55b9n9f7iheo76pA3RFs0MwKb6nVXV
	qHUDJBY5WbhFBezVNWO3waPdnA==
X-Google-Smtp-Source: 
 ABdhPJx6how/oX8jYqsvnBhhXvPEoFPm3aziAPv7beJniQe1R2PrnEYB1hQyCGvIESnrpsyeE8aIIg==
X-Received: by 2002:ae9:c10e:: with SMTP id z14mr999215qki.538.1644267598361;
        Mon, 07 Feb 2022 12:59:58 -0800 (PST)
Received: from godzilla (192-0-174-222.cpe.teksavvy.com. [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 66sm5958491qte.42.2022.02.07.12.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 12:59:57 -0800 (PST)
Date: Mon, 7 Feb 2022 15:59:56 -0500 (EST)
From: Scott Murray <scott.murray@konsulko.com>
To: Joshua Watt <jpewhacker@gmail.com>, jsmoeller@linuxfoundation.org
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
In-Reply-To: <2e636f2e-dba9-e336-8060-9e8cce40cedb@gmail.com>
Message-ID: <dc177cfd-50c2-33e2-bd3c-b33d65ee35@spiteful.org>
References: <20220207192915.70095-1-saul.wold@windriver.com>
 <5aebf892-1a3d-9647-3490-39242941653@spiteful.org>
 <2e636f2e-dba9-e336-8060-9e8cce40cedb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 20:59:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161468

On Mon, 7 Feb 2022, Joshua Watt wrote:

>
> On 2/7/22 14:33, Scott Murray wrote:
> > On Mon, 7 Feb 2022, Saul Wold wrote:
> >
> >> This patch will read the begining of source files and try to find
> >> the SPDX-License-Identifier to populate the licenseInfoInFiles
> >> field for each source file. This does not populate licenseConcluded
> >> at this time, nor rolls it up to package level.
> >>
> >> We read as binary file since some source code seem to have some
> >> binary characters, the license is then converted to ascii strings.
> >>
> >> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> >> ---
> >> v2: Updated commit message, and fixed REGEX based on Peter's suggetion
> >>
> >>   meta/classes/create-spdx.bbclass | 23 +++++++++++++++++++++++
> >>   1 file changed, 23 insertions(+)
> >>
> >> diff --git a/meta/classes/create-spdx.bbclass
> >> b/meta/classes/create-spdx.bbclass
> >> index 8b4203fdb5..588489cc2b 100644
> >> --- a/meta/classes/create-spdx.bbclass
> >> +++ b/meta/classes/create-spdx.bbclass
> >> @@ -37,6 +37,24 @@ SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for
> >> SPDX packages created f
> >>
> >>   do_image_complete[depends] = "virtual/kernel:do_create_spdx"
> >>
> >> +def extract_licenses(filename):
> >> +    import re
> >> +    import oe.spdx
> >> +
> >> +    lic_regex = re.compile(b'SPDX-License-Identifier:\s+([-A-Za-z\d. ]+)[
> >> |\n|\r\n]*?')
> >> +
> >> +    try:
> >> +        with open(filename, 'rb') as f:
> >> +            size = min(15000, os.stat(filename).st_size)
> >> +            txt = f.read(size)
> >> +            licenses = re.findall(lic_regex, txt)
> >> +            if licenses:
> >> +                ascii_licenses = [lic.decode('ascii') for lic in licenses]
> >> +                return ascii_licenses
> >> +    except Exception as e:
> >> +        bb.warn(f"Exception reading {filename}: {e}")
> >> +    return None
> >> +
> >>   def get_doc_namespace(d, doc):
> >>       import uuid
> >>       namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS,
> >>       d.getVar("SPDX_UUID_NAMESPACE"))
> >> @@ -232,6 +250,11 @@ def add_package_files(d, doc, spdx_pkg, topdir,
> >> get_spdxid, get_types, *, archiv
> >>                           checksumValue=bb.utils.sha256_file(filepath),
> >>                       ))
> >>
> >> +                if "SOURCE" in spdx_file.fileTypes:
> >> +                    extracted_lics = extract_licenses(filepath)
> >> +                    if extracted_lics:
> >> +                        spdx_file.licenseInfoInFiles = extracted_lics
> >> +
> >>                   doc.files.append(spdx_file)
> >>                   doc.add_relationship(spdx_pkg, "CONTAINS", spdx_file)
> >>                   spdx_pkg.hasFiles.append(spdx_file.SPDXID)
> > IMO this seems like perhaps either going too far, or not far enough.  If
> > we go to the trouble to scan source files for explicit SPDX license
> > declarations, but do not go as far as pattern detection like the
> > meta-spdxscanner layer does with its use Scancode Toolkit
> > (https://github.com/nexB/scancode-toolkit), then it seems there's
> > more potential for giving users a false impression as to the completeness
> > of the resulting report/SBOM.  Perhaps that can be handled by making it
> > very clear that further scanning and auditing is still required in the
> > hopefully forthcoming create-spdx.bbclass documentation, but I can
> > imagine having to explain this to customers.
>
> Can you given an overview of what meta-spdxscanner does? I'm not quite clear
> what extra processing would be required here.

Jan-Simon can talk to it better, as he's done some dev work on the layer
and done tests with it against AGL (and the subsequent Fossology instance
experimentation), but AFAIK for the actual scanning scancode-toolkit
does pattern matching based license detection, so in theory it'll catch
excerpts of or slightly modified versions of the licenses in its
database, as opposed to just searching for SPDX-License-Identifier
declarations.  If everyone else is happy with the latter, I'm willing to
believe I'm offbase in my concerns, but either way I do think the
limitations are going to need to be documented so users (and their
lawyers) are aware of them.

Scott




