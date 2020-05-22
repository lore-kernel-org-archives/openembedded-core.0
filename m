Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.18635.1590170954645712457
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 11:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ck0D5tuT;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: ptsneves@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id h21so14022827ejq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 11:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QtguSF5ITMZoyix1nAeJpDb71Ae2rCnyNrE/ApqE6Yg=;
        b=ck0D5tuTE0Atc83Gt/0iTtqQX4k5BFsRMlVrY+OUp5P9jIrja19V+54Jj1burIBHq/
         nl5Yy0a3lZOtC5OPumgEQQCKHjBmjxqQT0ah/iUgQ3hcmvDWTEJ1PPG7HXdYGdRbZ4Ou
         O8QI5TqAO8MzMnARrT8KDFaHc6Y+sV7RkNhE6rb+rVVALYuTYyNd3R3w8T2AELGnOmqJ
         oVh6OFABRBcNLRcQce2mQuMCjNz8M1J9GfOJLUulqz1MmFg8g0iskNvyiiOXPIuAq092
         yI1bvDwcQKr8QwNkM1bIWXj39HfqD/Qhh8bQEFdN1e8FAMOLOJ7toNZTrpiwkSxI/7u/
         ZA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QtguSF5ITMZoyix1nAeJpDb71Ae2rCnyNrE/ApqE6Yg=;
        b=Bs4RSchHBlcxig1j0RCnSCLDxIk74KtG7FrzkJPk1m79GNGFgjfQ3doWno4Ys8H9fm
         +QbDfJgbw1YUwVQJA3hInUWcjyaaGRpjjhPymWV2OLBLXgnaxuSUREIZ3fewGY0H5qmV
         DRCbDgyQOeE5ECVV+TFX/Kayn0xkR1btjeIChLXz01ow6zCn1/Nj0DwGiAaByknfbLlA
         BySJZXw3irxavYpZPJIAt87E7qPCLgqH5YzY2jXGYvq4DwG8JT4cmF5Y+0dcQpIYVv8g
         RD0WqpGopJ29EJm0pdr08jTKLX6c62QcGA2rw4H2PlPoEZECO6V8J2sTTwjRPd/RHgfZ
         PcmQ==
X-Gm-Message-State: AOAM531avuwbdi30HydNGN7x81/NZrzxNqq3CA/Z5gb9Ual9SLclUDos
	eO1HcC5cmBd+P9PdhoOyTwxf+Sla/BR0Aexm3Q==
X-Google-Smtp-Source: ABdhPJzwYUlXEx3jtf12cWl3UL6sGtxcRTxf3tnwU/h0+ITGJ15rq3IiRzX4ZJJk1bJXtyosNohbj7G0UCAYH+haTJ0=
X-Received: by 2002:a17:906:aecc:: with SMTP id me12mr9929988ejb.525.1590170953037;
 Fri, 22 May 2020 11:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200522151335.7918-1-ptsneves@gmail.com> <20200522151335.7918-2-ptsneves@gmail.com>
 <CANNYZj9tpQRb95FX5ch47eH66f8xvr-EybMkmg1UsAxAHwqyfw@mail.gmail.com>
 <CAJO0J4gz9zz9iZ4EbrPvs7aVjT3Ro1WXhmwsb7izst2m=GLQSg@mail.gmail.com> <CALpKvHoR5OvUqaDXa0OdxMgpoDKAQNG9NM9pYa=cW9cL1J86TA@mail.gmail.com>
In-Reply-To: <CALpKvHoR5OvUqaDXa0OdxMgpoDKAQNG9NM9pYa=cW9cL1J86TA@mail.gmail.com>
From: "Paulo Neve" <ptsneves@gmail.com>
Date: Fri, 22 May 2020 20:09:00 +0200
Message-ID: <CAJO0J4hP71_27HDY7yoVR267TtppDp0jnYqQ1z61g5dBaTZX7Q@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] 2/2] package_{ipk, deb, rpm}.bbclass: support per package user-defined metadata.
To: Michael Ho <michael.ho@ieee.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Michael,

The behavior you describe is indeed what i wanted. If you say this is
already working then my patches are redundant. Even so i am surprised
it is working. Is it done automatically by the getVar function?

def get_package_additional_metadata (pkg_type, d):
    base_key = "PACKAGE_ADD_METADATA"
    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
        if d.getVar(key, False) is None:
            continue
        d.setVarFlag(key, "type", "list")
        if d.getVarFlag(key, "separator") is None:
            d.setVarFlag(key, "separator", "\\n")
        metadata_fields = [field.strip() for field in
oe.data.typed_value(key, d)]
        return "\n".join(metadata_fields).strip()

From my understanding, i do not see how the per package override
happens. Do you have the test for this functionality in oe-selftest?

Grateful for the feedback
Paulo Neves

On Fri, May 22, 2020 at 8:00 PM Michael Ho <michael.ho@ieee.org> wrote:
>
> Hi Paulo,
>
> I actually have some patches in my "to send upstream list" to address the documentation and some sstate-caching bugs with these variables so it's fresh to me at the moment.
> Correct me if I'm wrong but I think this is already available in the code (applying metadata specific to a certain package in a recipe, that is).
>
> eg. http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_ipk.bbclass at line 72 sets the local overrides so if PACKAGE_ADD_METADATA_IPK_xxx is set, it overrides PACKAGE_ADD_METADATA_IPK.
>
> For rpm, see
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n298 where the recipe wide variable is fetched
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n338 where the local override is also set
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n354 where the package specific variables are fetched
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/classes/package_rpm.bbclass#n436 where the package specific variables are applied to rpm packages
>
> I tested the zip recipe by applying these two lines:
> PACKAGE_ADD_METADATA_RPM = "Vendor: None"
> PACKAGE_ADD_METADATA_RPM_zip-dbg = "Vendor: Not you!"
> and could see differing results in the two rpm files produced.
>
> I think this covers the use case you're showing in your patches already, what do you think?
>
> Kind regards,
> Michael
>
> (sorry if this shows up as a triple email, my mail client wasn't cooperating).
>
> On Fri, May 22, 2020 at 5:29 PM Paulo Neve <ptsneves@gmail.com> wrote:
>>
>> Is ./meta/lib/oeqa/selftest/cases/package.py the right place?
>> If yes i can work on it. Note that this functionality is not used
>> anywhere in poky and is not documented at all. It just happened to
>> exist for a long time and be useful for my case.
>>
>> On Fri, May 22, 2020 at 5:22 PM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > Should there be a test for this functionality? Somewhere in oe-selftest perhaps where various package manager features are tested?
>> >
>> > Alex
>> >
>> > On Fri, 22 May 2020 at 17:13, Paulo Neve <ptsneves@gmail.com> wrote:
>> >>
>> >> Up to now the user defined metadata was set recipe wide,
>> >> meaning all the packages generated in a recipe where the
>> >> variable was set would get the same metadata. That is not
>> >> always ideal and is counter to the per package control that
>> >> is usually available.
>> >>
>> >> Keep support for package agnostic metadata but also add option
>> >> to add it to a specific option like:
>> >> PACKAGE_ADD_METADATA_${PN}_IPK = "mymeta: myvalue"
>> >>
>> >> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> >> ---
>> >>  meta/classes/package.bbclass     | 4 ++--
>> >>  meta/classes/package_deb.bbclass | 2 +-
>> >>  meta/classes/package_ipk.bbclass | 2 +-
>> >>  meta/classes/package_rpm.bbclass | 5 +++--
>> >>  4 files changed, 7 insertions(+), 6 deletions(-)
>> >>
>> >> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> >> index 0b5cf47749..1678e0d794 100644
>> >> --- a/meta/classes/package.bbclass
>> >> +++ b/meta/classes/package.bbclass
>> >> @@ -637,9 +637,9 @@ def get_package_mapping (pkg, basepkg, d, depversions=None):
>> >>
>> >>      return pkg
>> >>
>> >> -def get_package_additional_metadata (pkg_type, d):
>> >> +def get_package_additional_metadata (pkg_type, pkg_name, d):
>> >>      base_key = "PACKAGE_ADD_METADATA"
>> >> -    for key in ("%s_%s" % (base_key, pkg_type.upper()), base_key):
>> >> +    for key in ("%s_%s" % (base_key, pkg_type.upper()), "%s_%s_%s" % (base_key, pkg_name, pkg_type.upper()), base_key):
>> >>          if d.getVar(key, False) is None:
>> >>              continue
>> >>          d.setVarFlag(key, "type", "list")
>> >> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
>> >> index 790b26aef2..6ef9c8cb3a 100644
>> >> --- a/meta/classes/package_deb.bbclass
>> >> +++ b/meta/classes/package_deb.bbclass
>> >> @@ -167,7 +167,7 @@ def deb_write_pkg(pkg, d):
>> >>
>> >>          # more fields
>> >>
>> >> -        custom_fields_chunk = get_package_additional_metadata("deb", localdata)
>> >> +        custom_fields_chunk = get_package_additional_metadata("deb", pkgname, localdata)
>> >>          if custom_fields_chunk:
>> >>              ctrlfile.write(custom_fields_chunk)
>> >>              ctrlfile.write("\n")
>> >> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
>> >> index c008559e4a..f78cec7a70 100644
>> >> --- a/meta/classes/package_ipk.bbclass
>> >> +++ b/meta/classes/package_ipk.bbclass
>> >> @@ -155,7 +155,7 @@ def ipk_write_pkg(pkg, d):
>> >>              else:
>> >>                  ctrlfile.write(c % tuple(pullData(fs, localdata)))
>> >>
>> >> -        custom_fields_chunk = get_package_additional_metadata("ipk", localdata)
>> >> +        custom_fields_chunk = get_package_additional_metadata("ipk", pkgname, localdata)
>> >>          if custom_fields_chunk is not None:
>> >>              ctrlfile.write(custom_fields_chunk)
>> >>              ctrlfile.write("\n")
>> >> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
>> >> index 9145717f98..ab019192da 100644
>> >> --- a/meta/classes/package_rpm.bbclass
>> >> +++ b/meta/classes/package_rpm.bbclass
>> >> @@ -295,7 +295,6 @@ python write_specfile () {
>> >>      srcmaintainer  = d.getVar('MAINTAINER')
>> >>      srchomepage    = d.getVar('HOMEPAGE')
>> >>      srcdescription = d.getVar('DESCRIPTION') or "."
>> >> -    srccustomtagschunk = get_package_additional_metadata("rpm", d)
>> >>
>> >>      srcdepends     = d.getVar('DEPENDS')
>> >>      srcrdepends    = []
>> >> @@ -333,6 +332,8 @@ python write_specfile () {
>> >>          pkgname = localdata.getVar('PKG_%s' % pkg)
>> >>          if not pkgname:
>> >>              pkgname = pkg
>> >> +
>> >> +        srccustomtagschunk = get_package_additional_metadata("rpm", pkgname, d)
>> >>          localdata.setVar('PKG', pkgname)
>> >>
>> >>          localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
>> >> @@ -351,7 +352,7 @@ python write_specfile () {
>> >>          splitlicense = (localdata.getVar('LICENSE') or "")
>> >>          splitsection = (localdata.getVar('SECTION') or "")
>> >>          splitdescription = (localdata.getVar('DESCRIPTION') or ".")
>> >> -        splitcustomtagschunk = get_package_additional_metadata("rpm", localdata)
>> >> +        splitcustomtagschunk = get_package_additional_metadata("rpm", pkgname, localdata)
>> >>
>> >>          translate_vers('RDEPENDS', localdata)
>> >>          translate_vers('RRECOMMENDS', localdata)
>> >> --
>> >> 2.20.1
>> >>
>> >>
>> 
