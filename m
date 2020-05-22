Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.15326.1590161329472181233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 08:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ENVXP14+;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: ptsneves@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id n24so13506630ejd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UAu71MFLyVhfAS4OUthS5kIUsJK6LtSSwM16hgkTrjs=;
        b=ENVXP14+6eGheZYDJlkCnqwXYgSkCjm1Yf6BGjFDwm8u1fw2DIMAYr8+wbfrHRgZ5t
         +oCVOuU6YZmkxMLYqav7MoWs4GAEQ5CI3xgVkHrd36xvyI8CRgrnHUaAKMpzsY/tM508
         YexJvBeahln0MInykVna09D3eNl9pzg98eqZ+PspjFfZRy3Vt7tGhdeh97f7kxbI4RDy
         YqhuoHAjXgPVNlX6Eh3Qi/+7BB6qu+dMI/flsQrsqaubN9AyIZGw8tsZ87FTyCkb2l4f
         R7Pk/D3aEVFhLb2FH9DWc46EQj1e7wvRqHOKW099+4SCSKe8ypMO8CuWUYq8cBKWH2Jh
         fz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UAu71MFLyVhfAS4OUthS5kIUsJK6LtSSwM16hgkTrjs=;
        b=d453k+OsqeLT2SWcegyncHHAcVACgP1NsEVBxMw4qdBrb7mSf3BdL8aJgVKQtbtuIZ
         gy5HvypsUiGIsG7W7LRcuqGAQBccrILPlCjLu1o6GEFoPs07p7WtVos6gzHPGf3QPJYh
         D/Lnkc0p9jkuvVOjI1R3IVKp5pJWUPLw4iLNCf11NXtV/XOuR2izDYROKD5cOIaEGrfu
         KxS6ykD7Wv8xKS1wMriJISuEp5tAQbrYHrAF5xSXsH7j4htgy/X9d8wh4WD8zhLloDIO
         vu4yCrHhHzE0ZZRAqrUBaiQ6Nljb8LvNTLo3UGbajEmpJ25+nCdpAhOApo/rgNwDNnZW
         PWoA==
X-Gm-Message-State: AOAM53306EFjj4nrIEIVtwl9AfPXdHFR+zyRoHXlJReo8iGS35EecSjQ
	r/W15VEFlwbg6YEHo9+DsX1cZHGj/tPfK3tnTg==
X-Google-Smtp-Source: ABdhPJyyJqbRz9SO3Caeh89gTLdCLFcNGgwCUt4/fQLHL94Z8lVmrS0AaJbMbHy7aDEq0x8Ji4fQMRdCwGPGxaNVUEg=
X-Received: by 2002:a17:906:70c2:: with SMTP id g2mr8414088ejk.207.1590161327850;
 Fri, 22 May 2020 08:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200522151335.7918-1-ptsneves@gmail.com> <20200522151335.7918-2-ptsneves@gmail.com>
 <CANNYZj9tpQRb95FX5ch47eH66f8xvr-EybMkmg1UsAxAHwqyfw@mail.gmail.com>
In-Reply-To: <CANNYZj9tpQRb95FX5ch47eH66f8xvr-EybMkmg1UsAxAHwqyfw@mail.gmail.com>
From: "Paulo Neve" <ptsneves@gmail.com>
Date: Fri, 22 May 2020 17:28:36 +0200
Message-ID: <CAJO0J4gz9zz9iZ4EbrPvs7aVjT3Ro1WXhmwsb7izst2m=GLQSg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] 2/2] package_{ipk, deb, rpm}.bbclass: support per package user-defined metadata.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Is ./meta/lib/oeqa/selftest/cases/package.py the right place?
If yes i can work on it. Note that this functionality is not used
anywhere in poky and is not documented at all. It just happened to
exist for a long time and be useful for my case.

On Fri, May 22, 2020 at 5:22 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Should there be a test for this functionality? Somewhere in oe-selftest perhaps where various package manager features are tested?
>
> Alex
>
> On Fri, 22 May 2020 at 17:13, Paulo Neve <ptsneves@gmail.com> wrote:
>>
>> Up to now the user defined metadata was set recipe wide,
>> meaning all the packages generated in a recipe where the
>> variable was set would get the same metadata. That is not
>> always ideal and is counter to the per package control that
>> is usually available.
>>
>> Keep support for package agnostic metadata but also add option
>> to add it to a specific option like:
>> PACKAGE_ADD_METADATA_${PN}_IPK = "mymeta: myvalue"
>>
>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> ---
>>  meta/classes/package.bbclass     | 4 ++--
>>  meta/classes/package_deb.bbclass | 2 +-
>>  meta/classes/package_ipk.bbclass | 2 +-
>>  meta/classes/package_rpm.bbclass | 5 +++--
>>  4 files changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 0b5cf47749..1678e0d794 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d, depversions=None):
>>
>>      return pkg
>>
>> -def get_package_additional_metadata (pkg_type, d):
>> +def get_package_additional_metadata (pkg_type, pkg_name, d):
>>      base_key = "PACKAGE_ADD_METADATA"
>> -    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
>> +    for key in ("%s_%s" % (base_key, pkg_type.upper()), "%s_%s_%s" % (base_key, pkg_name, pkg_type.upper()), base_key):
>>          if d.getVar(key, False) is None:
>>              continue
>>          d.setVarFlag(key, "type", "list")
>> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
>> index 790b26aef2..6ef9c8cb3a 100644
>> --- a/meta/classes/package_deb.bbclass
>> +++ b/meta/classes/package_deb.bbclass
>> @@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):
>>
>>          # more fields
>>
>> -        custom_fields_chunk = get_package_additional_metadata("deb", localdata)
>> +        custom_fields_chunk = get_package_additional_metadata("deb", pkgname, localdata)
>>          if custom_fields_chunk:
>>              ctrlfile.write(custom_fields_chunk)
>>              ctrlfile.write("\n")
>> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
>> index c008559e4a..f78cec7a70 100644
>> --- a/meta/classes/package_ipk.bbclass
>> +++ b/meta/classes/package_ipk.bbclass
>> @@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):
>>              else:
>>                  ctrlfile.write(c % tuple(pullData(fs, localdata)))
>>
>> -        custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
>> +        custom_fields_chunk = get_package_additional_metadata("ipk", pkgname, localdata)
>>          if custom_fields_chunk is not None:
>>              ctrlfile.write(custom_fields_chunk)
>>              ctrlfile.write("\n")
>> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>> index 9145717f98..ab019192da 100644
>> --- a/meta/classes/package_rpm.bbclass
>> +++ b/meta/classes/package_rpm.bbclass
>> @@ -295,7 +295,6 @@ python write_specfile () {
>>      srcmaintainer  = d.getVar('MAINTAINER')
>>      srchomepage    = d.getVar('HOMEPAGE')
>>      srcdescription = d.getVar('DESCRIPTION') or "."
>> -    srccustomtagschunk = get_package_additional_metadata("rpm", d)
>>
>>      srcdepends     = d.getVar('DEPENDS')
>>      srcrdepends    = []
>> @@ -333,6 +332,8 @@ python write_specfile () {
>>          pkgname = localdata.getVar('PKG_%s' % pkg)
>>          if not pkgname:
>>              pkgname = pkg
>> +
>> +        srccustomtagschunk = get_package_additional_metadata("rpm", pkgname, d)
>>          localdata.setVar('PKG', pkgname)
>>
>>          localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
>> @@ -351,7 +352,7 @@ python write_specfile () {
>>          splitlicense = (localdata.getVar('LICENSE') or "")
>>          splitsection = (localdata.getVar('SECTION') or "")
>>          splitdescription = (localdata.getVar('DESCRIPTION') or ".")
>> -        splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
>> +        splitcustomtagschunk = get_package_additional_metadata("rpm", pkgname, localdata)
>>
>>          translate_vers('RDEPENDS', localdata)
>>          translate_vers('RRECOMMENDS', localdata)
>> --
>> 2.20.1
>>
>> 
