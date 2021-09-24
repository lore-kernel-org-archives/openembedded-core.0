Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.5020.1632467787187837922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 00:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xaj4AaRn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id w17so24227555wrv.10
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 00:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Er9u24zU8uIpizVcvr/+ldniP3A2S1J5B8111f9LHr4=;
        b=Xaj4AaRn7bB/WMZ1Cl7vitHpzlGUQegIQM8D1xqRI6SQmO3LyU4HBQxjtwpH33nuZW
         YlBk6Ch5k4NeUPDpmEtgf2MmQBvms5FvNBVCCCyEKkneJumOMDlJFQSoXL2m5wRf83cH
         wVHxB3wjQ6uFChPqDiDdp6SkEqIN0IMmjlBlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Er9u24zU8uIpizVcvr/+ldniP3A2S1J5B8111f9LHr4=;
        b=EnsvkPv+jDpfbmF4ol3Eox+PyehmitA1EMN79Fhex5jYLFfUXohWFGKLIq43ZXhgYQ
         JuRW2fJIYb4/2bnSvzMgOXn9/M6UxJPR0dXHbUK4uPRZXfQhl23OmZVVkO9fZxsHCfqt
         zbSr9pUD+NrWQYCUKE5vd8gfuegY2ibbxOuQabbz0b4wflNkS21UUhhfWgtWbwlmXaKC
         Vo91vkSrqL8gMu2kil9vzHHCE/rPCNY4R7G4fLrRYXhQqRsSRG++czXdf7Wu+GSzuf2o
         oXXervidORLFkkYWN15OshI8J9JK1lRCd8lzdwgxlyWdbQBxZNBgyoHz1wLIt39UPOLp
         7PhA==
X-Gm-Message-State: AOAM532hKLg0p8yJKzniMD8ovG38p/L75LXjDJfUQwVNYLx6MB1onb2O
	E432euF+ErcPc8coiyP5yXPDEw==
X-Google-Smtp-Source: ABdhPJzZ8BQsp1DdTHBmTGvIeMK76pkoPQATfkX8SHQAxo1X4MPqrxdHOSX41Q81tK8Fwo77QMIhNA==
X-Received: by 2002:a5d:6cb1:: with SMTP id a17mr9636572wra.72.1632467785569;
        Fri, 24 Sep 2021 00:16:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:88ae:54fd:dbd9:15ba? ([2001:8b0:aba:5f3c:88ae:54fd:dbd9:15ba])
        by smtp.gmail.com with ESMTPSA id v17sm5517282wro.62.2021.09.24.00.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 00:16:25 -0700 (PDT)
Message-ID: <00ee293a25fb1c441bfe8c54015eb85f05178789.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] create-spdx: Don't collect natives sources
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, Saul Wold <Saul.Wold@windriver.com>,
  openembedded-core@lists.openembedded.org
Date: Fri, 24 Sep 2021 08:16:22 +0100
In-Reply-To: <02196b6e-af2e-8046-a64b-8fe8b13e3fbf@gmail.com>
References: <20210923205328.2662727-1-saul.wold@windriver.com>
	 <91fdbb39-dded-4c59-75de-4a8e223f370a@gmail.com>
	 <bd23a9da-94ad-4386-1460-8107b7be59ec@windriver.com>
	 <5e3b148c-9e63-60fd-0a0d-096c73889ae4@gmail.com>
	 <02196b6e-af2e-8046-a64b-8fe8b13e3fbf@gmail.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-09-23 at 17:14 -0500, Joshua Watt wrote:
> On 9/23/21 5:07 PM, Joshua Watt wrote:
> > 
> > On 9/23/21 4:29 PM, Saul Wold wrote:
> > > 
> > > 
> > > On 9/23/21 2:05 PM, Joshua Watt wrote:
> > > > 
> > > > On 9/23/21 3:53 PM, Saul Wold wrote:
> > > > > Extend the SPDXPackage to include is_native so it can be used later in
> > > > > the processing.
> > > > > 
> > > > > When the collect_dep_sources() runs, it collects sources from both 
> > > > > native
> > > > > and non-native recipes. Later when the GENERATED_FROM matching 
> > > > > occurs it
> > > > > may find the file (via checksum) from the native recipe since it's the
> > > > > same checksum as the target file. The that are generated DocumentRefs
> > > > > point to the native recipe rather than the target recipe DocumentRef.
> > > > > 
> > > > > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > > > > ---
> > > > >   meta/classes/create-spdx.bbclass | 11 +++++++++--
> > > > >   meta/lib/oe/spdx.py              |  1 +
> > > > >   2 files changed, 10 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/meta/classes/create-spdx.bbclass 
> > > > > b/meta/classes/create-spdx.bbclass
> > > > > index 3c73c21c04..e565f0bf6c 100644
> > > > > --- a/meta/classes/create-spdx.bbclass
> > > > > +++ b/meta/classes/create-spdx.bbclass
> > > > > @@ -336,6 +336,10 @@ def collect_dep_sources(d, dep_recipes):
> > > > >       sources = {}
> > > > >       for dep in dep_recipes:
> > > > > +        # Don't collect sources from native recipes as they
> > > > > +        # match non-native sources also.
> > > > > +        if dep.recipe.is_native == "True":
> > > > > +            continue
> > > > >           recipe_files = set(dep.recipe.hasFiles)
> > > > >           for spdx_file in dep.doc.files:
> > > > > @@ -382,7 +386,6 @@ python do_create_spdx() {
> > > > >       include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
> > > > >       archive_sources = d.getVar("SPDX_ARCHIVE_SOURCES") == "1"
> > > > >       archive_packaged = d.getVar("SPDX_ARCHIVE_PACKAGED") == "1"
> > > > > -    is_native = bb.data.inherits_class("native", d)
> > > > >       creation_time = 
> > > > > datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
> > > > > @@ -401,6 +404,10 @@ python do_create_spdx() {
> > > > >       recipe.name = d.getVar("PN")
> > > > >       recipe.versionInfo = d.getVar("PV")
> > > > >       recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
> > > > > +    if bb.data.inherits_class("native", d):
> > > > > +        recipe.is_native = "True"
> > > > > +    else:
> > > > > +        recipe.is_native = "False"
> > > > >       for s in d.getVar('SRC_URI').split():
> > > > >           if not s.startswith("file://"):
> > > > > @@ -480,7 +487,7 @@ python do_create_spdx() {
> > > > >       sources = collect_dep_sources(d, dep_recipes)
> > > > >       found_licenses = {license.name:recipe_ref.externalDocumentId 
> > > > > + ":" + license.licenseId for license in 
> > > > > doc.hasExtractedLicensingInfos}
> > > > > -    if not is_native:
> > > > > +    if recipe.is_native is "False":
> > > > >           bb.build.exec_func("read_subpackage_metadata", d)
> > > > >           pkgdest = Path(d.getVar("PKGDEST"))
> > > > > diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
> > > > > index 9814fbfd66..452148f339 100644
> > > > > --- a/meta/lib/oe/spdx.py
> > > > > +++ b/meta/lib/oe/spdx.py
> > > > > @@ -164,6 +164,7 @@ class SPDXPackage(SPDXObject):
> > > > >       packageVerificationCode = _Object(SPDXPackageVerificationCode)
> > > > >       hasFiles = _StringList()
> > > > >       packageFileName = _String()
> > > > > +    is_native = _String()
> > > > 
> > > > It's probably not well documented in this file, but this has to 
> > > > match to the SPDX standard; we can't add arbitrary fields here. When 
> > > > I was referring to an "annotation" I was specifcially referring to 
> > > > an SPDX annotation:
> > > > 
> > > I should have figured that!
> > > 
> > > > https://spdx.github.io/spdx-spec/8-annotations/
> > > > 
> > > > We'd need to decide on some schema for encoding the data in the 
> > > > annotation
> > > > 
> > > So we need to create an SPDXAnnotation type on spdx.py and define 
> > > what we want in the AnnotationComment field?
> > 
> > Exactly. We can use the tool field to indicate that this is data we 
> > care about for a specific annotation, then put JSON or something in 
> > the annotation itself.
> 
> 
> Also, I forgot to mention but I found it really hard to convert the 
> normal SPDX spec document into the structure we need for JSON encoding 
> in spdx.py. I found it *much* easier to decipher the actual SPDX JSON 
> schema document:
> 
> https://github.com/spdx/spdx-spec/blob/development/v2.2.1/schemas/spdx-schema.json
> 
> 

Could someone put a few comments into the code just so that we don't forget some
of these constraints in future please?

Cheers,

Richard

