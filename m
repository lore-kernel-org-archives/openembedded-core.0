Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957D2E7719A
	for <webhook@archiver.kernel.org>; Sat, 11 Jan 2025 15:40:17 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.17658.1736610014866969785
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jan 2025 07:40:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F/4wfjUP;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: colinmca242@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso3830060a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 07:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736610013; x=1737214813; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+jjrx66s1oYUYbvJWnZutNXrgVbVY5b+XsUsIBq8rR4=;
        b=F/4wfjUPkCMTo3hBhvnrdtDcZy9cFkHb+oLBQCwUtCElnbPmWpSgI2TzhdQTFRlcEn
         vuAPF30/3Xk5AlQPEUgp8nQ/3ObCtGOm1hMcmhVaS05+vvDfaU4+NMJuss2apD+vnkHD
         YDc3Jtf1qRkj+YHllfjnoT0qNVS+1ZhWAtF2hD6hYegW+xKmw9KD+c3zVKiF+rLHZE0Q
         il1JooH6xPoqeQ3SihmoHI/BI9tflvpDO+sX1hzwhEqHhOCAoxqvLHQ4j/bE5U5eX+SU
         kVoGJEp6vlcX551AHqOv9aIg+FFy+Xwf//KnP+MpnQ29UFeB09MJjc9Za6iIqF58O6iw
         6Nuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736610013; x=1737214813;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+jjrx66s1oYUYbvJWnZutNXrgVbVY5b+XsUsIBq8rR4=;
        b=M7Bu6Zbc+b5dMohNyEQmclPWUsJZCMqvW0vqsMCt7nnAg9fHi3bA2QoXY65dzza1ey
         5ozDGd/3qnnPpX/RptS2VyOBFvNgta1SwlvbU5dYKvC34+PCdyZBO0kJDbB4OXwUJqe4
         QPxbompEumZWb5wrJjgezbkwohUAbAhm/ZHvVdU/rXFxY+inSY5qFuBG1M6gIU6T6CnP
         EylYitQSoCcPaWv0gcoYglBBlMHu4OEm6DgeKOEajYeALhYxjQ7mShbdo37ZBe5AWeze
         7D1ARgY0RF1YePy/Xnfye0Rz1Q2zoIZ9rqiNELMOYDOqgz4GxEuIrc0I2UtLwwKd4wfN
         biQw==
X-Gm-Message-State: AOJu0YzVtcoF1wcZqro/BPo/PetddMTPNUGA1F5Z5dDp0OSzkd2Goj4e
	ujvUhyWFmRd8OLzRM4zMKe/IO/x3tujibSsOFwzFqYIBul/DXec25aBKDpp47Qtx36xDBwQ95Q6
	eP1xgEst8VOs7fMUbOMFktJbEy/8=
X-Gm-Gg: ASbGncuU6JArS/8k70IOQGZwl/U50gS0zzu8pGvScjIUQojhQ6c8k7dLh9pkz7R0lOe
	D1PNvgyBu5fuwIlWlUkmHbzy8C5UU5teVp/WRLM8=
X-Google-Smtp-Source: AGHT+IGk2kISzypgCG4xAo+vBg2ml4+QLKZh56GwXgAjrIKbI0RXDAkV7ja/yfZn4U3it4fA+TzXGXGdLgCOyw7fAjA=
X-Received: by 2002:a50:85cd:0:b0:5d9:84e8:6152 with SMTP id
 4fb4d7f45d1cf-5d984e86170mr8573064a12.32.1736610012769; Sat, 11 Jan 2025
 07:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20241230192224.113886-1-colinmca242@gmail.com>
 <20241230192224.113886-2-colinmca242@gmail.com> <181947C8BF47FE99.17938@lists.openembedded.org>
 <18194A5A622A45B9.23974@lists.openembedded.org> <AS1PR10MB569731535FEEA9F688D90067FD1C2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CAAyLwgT543RzpjtAEQr0rYRH6G=EUE49Mvj-N0-z8EoEJVPSww@mail.gmail.com>
In-Reply-To: <CAAyLwgT543RzpjtAEQr0rYRH6G=EUE49Mvj-N0-z8EoEJVPSww@mail.gmail.com>
From: Colin <colinmca242@gmail.com>
Date: Sat, 11 Jan 2025 09:40:01 -0600
X-Gm-Features: AbW1kvaQwTGYosW6R5rnfvR94KNzcGt8diIJlsCtZ_sn1hGpVfEZT8KHritvdnY
Message-ID: <CAAyLwgRmonLpg9Wd2JWRqY2TdZvja8H1sr9+WG8AaDFf26hmLw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ecb3b3062b7006f1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jan 2025 15:40:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209669

--000000000000ecb3b3062b7006f1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Actually, the test I added was wrong, I was asserting equal to
set("CVE-2023-33460") instead of {"CVE-2023-33460"} in my test case.

Back to square one...

Colin

On Sat, Jan 11, 2025 at 9:25=E2=80=AFAM Colin <colinmca242@gmail.com> wrote=
:

> Hi Peter,
>
> I'm currently looking at this. I added CVE-2023-33460.patch to
> test_parse_cve_from_patch_contents and ran oe-selftest. I see the issue w=
hy
> these patches are no longer being marked as solved.
>
> 2025-01-11 15:17:33,396 - oe-selftest - INFO -
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 2025-01-11 15:17:33,396 - oe-selftest - INFO - FAIL:
> test_parse_cve_from_patch_contents (cve_check.CVECheck)
> 2025-01-11 15:17:33,397 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2025-01-11 15:17:33,397 - oe-selftest - INFO - Traceback (most recent cal=
l
> last):
>   File
> "/home/colin/development/yocto/poky/meta/lib/oeqa/selftest/cases/cve_chec=
k.py",
> line 209, in test_parse_cve_from_patch_contents
>     self.assertEqual(
> AssertionError: Items in the first set but not the second:
> 'CVE-2023-33460'
> Items in the second set but not the first:
> 'E'
> '2'
> 'V'
> 'C'
> '-'
> '0'
> '4'
> '3'
> '6'
>
> 2025-01-11 15:17:33,397 - oe-selftest - INFO -
> ----------------------------------------------------------------------
> 2025-01-11 15:17:33,397 - oe-selftest - INFO - Ran 1 test in 0.247s
> 2025-01-11 15:17:33,398 - oe-selftest - INFO - FAILED
> 2025-01-11 15:17:33,398 - oe-selftest - INFO -  (failures=3D1)
> 2025-01-11 15:17:46,988 - oe-selftest - INFO - RESULTS:
> 2025-01-11 15:17:46,988 - oe-selftest - INFO - RESULTS -
> cve_check.CVECheck.test_parse_cve_from_patch_contents: FAILED (0.02s)
> 2025-01-11 15:17:46,996 - oe-selftest - INFO - SUMMARY:
> 2025-01-11 15:17:46,996 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t
> in 0.249s
> 2025-01-11 15:17:46,996 - oe-selftest - INFO - oe-selftest - FAIL -
> Required tests failed (successes=3D0, skipped=3D0, failures=3D1, errors=
=3D0)
>
> For some reason the CVE string itself is getting put into a set, instead
> of the full string being placed into a set. I'll track down where this is
> happening and push up a fix, including adding this update to the test.
>
> Not sure why I didn't add a test case with a single CVE ID in the patch
> contents...This was my mistake and I apologize. Sorry for any
> inconveniences I caused.
>
> Best,
> Colin
>
> On Fri, Jan 10, 2025 at 3:26=E2=80=AFAM Marko, Peter <Peter.Marko@siemens=
.com>
> wrote:
>
>> Looking at the reopened CVEs in meta-oe, I can't understand why are some
>> reported.
>>
>> $ grep -rI CVE-2023-33460 ./
>> ./meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch:CVE:
>> CVE-2023-33460
>> ./meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb:
>>  file://CVE-2023-33460.patch \
>> $ grep -rI CVE-2020-29074 ./
>> ./meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch:CVE:
>> CVE-2020-29074
>> ./meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb:
>>  file://CVE-2020-29074.patch \
>>
>> These look good to me, but they are not matched anymore and show as open=
.
>>
>> Peter
>>
>> > -----Original Message-----
>> > From: openembedded-core@lists.openembedded.org <openembedded-
>> > core@lists.openembedded.org> On Behalf Of Peter Marko via
>> > lists.openembedded.org
>> > Sent: Friday, January 10, 2025 10:21
>> > To: colinmca242@gmail.com; openembedded-core@lists.openembedded.org
>> > Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
>> >
>> > Or should we rather rename all those patches which violate current cod=
e?
>> > What is then the meaning of CVE: tag within the patch if it's not used
>> but it's
>> > enforced?
>> > We should probably remove cve_payload_tag handling from
>> > test_cve_tag_format...
>> >
>> > Peter
>> >
>> > > -----Original Message-----
>> > > From: openembedded-core@lists.openembedded.org <openembedded-
>> > > core@lists.openembedded.org> On Behalf Of Peter Marko via
>> > > lists.openembedded.org
>> > > Sent: Friday, January 10, 2025 9:34
>> > > To: colinmca242@gmail.com; openembedded-
>> > core@lists.openembedded.org
>> > > Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsin=
g
>> > >
>> > > Hello,
>> > >
>> > > This patch has caused a regression in detecting cve patches.
>> > > Master jumped by 32 CVEs after merging this commit.
>> > > These are for sure patched but it's not detected anymore.
>> > > See https://valkyrie.yocto.io/pub/non-release/patchmetrics/
>> > > (master should be identical to scarthgap/styhead except for kernel
>> CVEs)
>> > >
>> > > Reports cannot be used anymore for picking CVEs for TODO list.
>> > > So this patch should be reverted or fixed.
>> > >
>> > > Peter
>> > >
>> > > > -----Original Message-----
>> > > > From: openembedded-core@lists.openembedded.org <openembedded-
>> > > > core@lists.openembedded.org> On Behalf Of Colin McAllister via
>> > > > lists.openembedded.org
>> > > > Sent: Monday, December 30, 2024 20:22
>> > > > To: openembedded-core@lists.openembedded.org
>> > > > Cc: Colin McAllister <colinmca242@gmail.com>
>> > > > Subject: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing
>> > > >
>> > > > The cve_check functionality to parse CVE IDs from the patch
>> filename and
>> > > > patch contents have been reworked to improve parsing and also
>> utilize
>> > > > tests. This ensures that the parsing works as intended.
>> > > >
>> > > > Additionally, the new patched_cves dict has a few issues I tried t=
o
>> fix
>> > > > as well. If multiple patch files exist for a single CVE ID, only t=
he
>> > > > last one will show up with the "resource" key. The value for the
>> > > > "resource" key has been updated to hold a list and return all patc=
h
>> > > > files associated with a given CVE ID. Also, at the end of
>> > > > get_patch_cves, CVE_STATUS can overwrite an existing entry in the
>> dict.
>> > > > This could cause an issue, for example, if a CVE has been addresse=
d
>> via
>> > > > a patch, but a CVE_STATUS line also exists that ignores the given
>> CVE
>> > > > ID. A warning has been added if this ever happens.
>> > > >
>> > > > Signed-off-by: Colin McAllister <colinmca242@gmail.com>
>> > > > ---
>> > > >
>> > > > I noticed that there are some patches, especially in older verison=
s
>> of
>> > > > Yocto, where the "CVE: " tag was used with multiple CVE IDs in
>> different
>> > > > formats, like "CVE-YYYY-XXXX & CVE-YYYY-XXXX" or
>> > > > "CVE-YYYY-XXXX, CVE-YYYY-XXXX". Currently, only space-delimited CV=
E
>> > > > IDs will be parsed, but documentation doesn't indicate that is the
>> only
>> > > > supported format. I figured it'd be nice to update the code to be
>> able
>> > > > to support multiple formats, that way this patch could be
>> backported to
>> > > > fix those patches. I also wanted to add unit tests to ensure the
>> patch
>> > > > parsing behavior is preserved.
>> > > >
>> > > > I'd also like to update the patch filename parsing to parse
>> multiple CVE
>> > > > IDs from the filename, but based on the comments, it seems like
>> there
>> > > > was a reason why only the last CVE ID is extracted from the
>> filename.
>> > > > I'd be happy to submit a V2 patch or an additional patch to update
>> the
>> > > > function if that sounds good for the maintainers.
>> > > >
>> > > > V2 Changes:
>> > > > I mistakenly created this patch without fb3f440 applied. I updated
>> > > > get_patched_cves to return a dict instead of a set.
>> > > >
>> > > > I also improved the docstrings for these new functions to be more
>> > > > descriptive and also specify the return types.
>> > > >
>> > > > I also found a few issues with the dictionary object created by
>> > > > get_patched_cves that have now been addressed in this commit.
>> > > >
>> > > >  meta/lib/oe/cve_check.py                  | 166 ++++++++++++-----=
-
>> > > >  meta/lib/oeqa/selftest/cases/cve_check.py | 205
>> > > > ++++++++++++++++++++++
>> > > >  2 files changed, 317 insertions(+), 54 deletions(-)
>> > > >
>> > > > diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
>> > > > index 280f9f613d..85a899a880 100644
>> > > > --- a/meta/lib/oe/cve_check.py
>> > > > +++ b/meta/lib/oe/cve_check.py
>> > > > @@ -5,9 +5,11 @@
>> > > >  #
>> > > >
>> > > >  import collections
>> > > > -import re
>> > > > -import itertools
>> > > >  import functools
>> > > > +import itertools
>> > > > +import os.path
>> > > > +import re
>> > > > +import oe.patch
>> > > >
>> > > >  _Version =3D collections.namedtuple(
>> > > >      "_Version", ["release", "patch_l", "pre_l", "pre_v"]
>> > > > @@ -71,76 +73,132 @@ def _cmpkey(release, patch_l, pre_l, pre_v):
>> > > >      return _release, _patch, _pre
>> > > >
>> > > >
>> > > > -def get_patched_cves(d):
>> > > > +def parse_cve_from_filename(patch_filename):
>> > > >      """
>> > > > -    Get patches that solve CVEs using the "CVE: " tag.
>> > > > +    Parses CVE ID from the filename
>> > > > +
>> > > > +    Matches the last "CVE-YYYY-ID" in the file name, also if
>> written
>> > > > +    in lowercase. Possible to have multiple CVE IDs in a single
>> > > > +    file name, but only the last one will be detected from the
>> file name.
>> > > > +
>> > > > +    Returns the last CVE ID foudn in the filename. If no CVE ID i=
s
>> found
>> > > > +    an empty string is returned.
>> > > >      """
>> > > > +    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d{4,})",
>> > > > re.IGNORECASE)
>> > > >
>> > > > -    import re
>> > > > -    import oe.patch
>> > > > +    # Check patch file name for CVE ID
>> > > > +    fname_match =3D cve_file_name_match.search(patch_filename)
>> > > > +    return fname_match.group(1).upper() if fname_match else ""
>> > > >
>> > > > -    cve_match =3D re.compile(r"CVE:( CVE-\d{4}-\d+)+")
>> > > >
>> > > > -    # Matches the last "CVE-YYYY-ID" in the file name, also if
>> written
>> > > > -    # in lowercase. Possible to have multiple CVE IDs in a single
>> > > > -    # file name, but only the last one will be detected from the
>> file name.
>> > > > -    # However, patch files contents addressing multiple CVE IDs a=
re
>> > > supported
>> > > > -    # (cve_match regular expression)
>> > > > -    cve_file_name_match =3D re.compile(r".*(CVE-\d{4}-\d+)",
>> > > re.IGNORECASE)
>> > > > +def parse_cves_from_patch_contents(patch_contents):
>> > > > +    """
>> > > > +    Parses CVE IDs from patch contents
>> > > >
>> > > > +    Matches all CVE IDs contained on a line that starts with "CVE=
:
>> ". Any
>> > > > +    delimiter (',', '&', "and", etc.) can be used without any
>> issues. Multiple
>> > > > +    "CVE:" lines can also exist.
>> > > > +
>> > > > +    Returns a set of all CVE IDs found in the patch contents.
>> > > > +    """
>> > > > +    cve_ids =3D set()
>> > > > +    cve_match =3D re.compile(r"CVE-\d{4}-\d{4,}")
>> > > > +    # Search for one or more "CVE: " lines
>> > > > +    for line in patch_contents.split("\n"):
>> > > > +        if not line.startswith("CVE:"):
>> > > > +            continue
>> > > > +        cve_ids.update(cve_match.findall(line))
>> > > > +    return cve_ids
>> > > > +
>> > > > +
>> > > > +def parse_cves_from_patch_file(patch_file):
>> > > > +    """
>> > > > +    Parses CVE IDs associated with a particular patch file, using
>> both the
>> > > > filename
>> > > > +    and patch contents.
>> > > > +
>> > > > +    Returns a set of all CVE IDs found in the patch filename and
>> contents.
>> > > > +    """
>> > > > +    cve_ids =3D set()
>> > > > +    filename_cve =3D parse_cve_from_filename(patch_file)
>> > > > +    if filename_cve:
>> > > > +        bb.debug(2, "Found %s from patch file name %s" %
>> (filename_cve,
>> > > > patch_file))
>> > > > +        cve_ids.add(parse_cve_from_filename(patch_file))
>> > > > +
>> > > > +    # Remote patches won't be present and compressed patches won'=
t
>> be
>> > > > +    # unpacked, so say we're not scanning them
>> > > > +    if not os.path.isfile(patch_file):
>> > > > +        bb.note("%s is remote or compressed, not scanning content=
"
>> %
>> > > > patch_file)
>> > > > +        return cve_ids
>> > > > +
>> > > > +    with open(patch_file, "r", encoding=3D"utf-8") as f:
>> > > > +        try:
>> > > > +            patch_text =3D f.read()
>> > > > +        except UnicodeDecodeError:
>> > > > +            bb.debug(
>> > > > +                1,
>> > > > +                "Failed to read patch %s using UTF-8 encoding"
>> > > > +                " trying with iso8859-1" % patch_file,
>> > > > +            )
>> > > > +            f.close()
>> > > > +            with open(patch_file, "r", encoding=3D"iso8859-1") as=
 f:
>> > > > +                patch_text =3D f.read()
>> > > > +
>> > > > +    cve_ids.update(parse_cves_from_patch_contents(patch_text))
>> > > > +
>> > > > +    if not cve_ids:
>> > > > +        bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
>> > > > +    else:
>> > > > +        bb.debug(2, "Patch %s solves %s" % (patch_file, ",
>> > > > ".join(sorted(cve_ids))))
>> > > > +
>> > > > +    return cve_ids
>> > > > +
>> > > > +
>> > > > +def get_patched_cves(d):
>> > > > +    """
>> > > > +    Determines the CVE IDs that have been solved by either patche=
s
>> > incuded
>> > > > within
>> > > > +    SRC_URI or by setting CVE_STATUS.
>> > > > +
>> > > > +    Returns a dictionary with the CVE IDs as keys and an associat=
ed
>> > dictonary
>> > > > of
>> > > > +    relevant metadata as the value.
>> > > > +    """
>> > > >      patched_cves =3D {}
>> > > >      patches =3D oe.patch.src_patches(d)
>> > > >      bb.debug(2, "Scanning %d patches for CVEs" % len(patches))
>> > > > +
>> > > > +    # Check each patch file
>> > > >      for url in patches:
>> > > >          patch_file =3D bb.fetch.decodeurl(url)[2]
>> > > > -
>> > > > -        # Check patch file name for CVE ID
>> > > > -        fname_match =3D cve_file_name_match.search(patch_file)
>> > > > -        if fname_match:
>> > > > -            cve =3D fname_match.group(1).upper()
>> > > > -            patched_cves[cve] =3D {"abbrev-status": "Patched",
>> "status": "fix-file-
>> > > > included", "resource": patch_file}
>> > > > -            bb.debug(2, "Found %s from patch file name %s" % (cve=
,
>> > patch_file))
>> > > > -
>> > > > -        # Remote patches won't be present and compressed patches
>> won't be
>> > > > -        # unpacked, so say we're not scanning them
>> > > > -        if not os.path.isfile(patch_file):
>> > > > -            bb.note("%s is remote or compressed, not scanning
>> content" %
>> > > > patch_file)
>> > > > -            continue
>> > > > -
>> > > > -        with open(patch_file, "r", encoding=3D"utf-8") as f:
>> > > > -            try:
>> > > > -                patch_text =3D f.read()
>> > > > -            except UnicodeDecodeError:
>> > > > -                bb.debug(1, "Failed to read patch %s using UTF-8
>> encoding"
>> > > > -                        " trying with iso8859-1" %  patch_file)
>> > > > -                f.close()
>> > > > -                with open(patch_file, "r", encoding=3D"iso8859-1"=
)
>> as f:
>> > > > -                    patch_text =3D f.read()
>> > > > -
>> > > > -        # Search for one or more "CVE: " lines
>> > > > -        text_match =3D False
>> > > > -        for match in cve_match.finditer(patch_text):
>> > > > -            # Get only the CVEs without the "CVE: " tag
>> > > > -            cves =3D patch_text[match.start()+5:match.end()]
>> > > > -            for cve in cves.split():
>> > > > -                bb.debug(2, "Patch %s solves %s" % (patch_file,
>> cve))
>> > > > -                patched_cves[cve] =3D {"abbrev-status": "Patched"=
,
>> "status": "fix-
>> > file-
>> > > > included", "resource": patch_file}
>> > > > -                text_match =3D True
>> > > > -
>> > > > -        if not fname_match and not text_match:
>> > > > -            bb.debug(2, "Patch %s doesn't solve CVEs" % patch_fil=
e)
>> > > > +        for cve_id in parse_cves_from_patch_file(patch_file):
>> > > > +            if cve_id not in patched_cves:
>> > > > +                {
>> > > > +                    "abbrev-status": "Patched",
>> > > > +                    "status": "fix-file-included",
>> > > > +                    "resource": [patch_file],
>> > > > +                }
>> > > > +            else:
>> > > > +                patched_cves[cve_id]["resource"].append(patch_fil=
e)
>> > > >
>> > > >      # Search for additional patched CVEs
>> > > > -    for cve in (d.getVarFlags("CVE_STATUS") or {}):
>> > > > -        decoded_status =3D decode_cve_status(d, cve)
>> > > > +    for cve_id in d.getVarFlags("CVE_STATUS") or {}:
>> > > > +        decoded_status =3D decode_cve_status(d, cve_id)
>> > > >          products =3D d.getVar("CVE_PRODUCT")
>> > > > -        if has_cve_product_match(decoded_status, products) =3D=3D=
 True:
>> > > > -            patched_cves[cve] =3D {
>> > > > +        if has_cve_product_match(decoded_status, products):
>> > > > +            if cve_id in patched_cves:
>> > > > +                bb.warn(
>> > > > +                    'CVE_STATUS[%s] =3D "%s" is overwriting previ=
ous
>> status of "%s:
>> > > %s"'
>> > > > +                    % (
>> > > > +                        cve_id,
>> > > > +                        d.getVarFlag("CVE_STATUS", cve_id),
>> > > > +                        patched_cves[cve_id]["abbrev-status"],
>> > > > +                        patched_cves[cve_id]["status"],
>> > > > +                    )
>> > > > +                )
>> > > > +            patched_cves[cve_id] =3D {
>> > > >                  "abbrev-status": decoded_status["mapping"],
>> > > >                  "status": decoded_status["detail"],
>> > > >                  "justification": decoded_status["description"],
>> > > >                  "affected-vendor": decoded_status["vendor"],
>> > > > -                "affected-product": decoded_status["product"]
>> > > > +                "affected-product": decoded_status["product"],
>> > > >              }
>> > > >
>> > > >      return patched_cves
>> > > > diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py
>> > > > b/meta/lib/oeqa/selftest/cases/cve_check.py
>> > > > index 3dd3e89d3e..511e4b81b4 100644
>> > > > --- a/meta/lib/oeqa/selftest/cases/cve_check.py
>> > > > +++ b/meta/lib/oeqa/selftest/cases/cve_check.py
>> > > > @@ -120,6 +120,211 @@ class CVECheck(OESelftestTestCase):
>> > > >          self.assertEqual(has_cve_product_match(status, "test
>> glibca:glibc"),
>> > > True)
>> > > >          self.assertEqual(has_cve_product_match(status,
>> "glibca:glibc test"),
>> > > True)
>> > > >
>> > > > +    def test_parse_cve_from_patch_filename(self):
>> > > > +        from oe.cve_check import parse_cve_from_filename
>> > > > +
>> > > > +        # Patch filename without CVE ID
>> > > > +
>> self.assertEqual(parse_cve_from_filename("0001-test.patch"), "")
>> > > > +
>> > > > +        # Patch with single CVE ID
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("CVE-2022-12345.patch"),
>> "CVE-2022-
>> > > > 12345"
>> > > > +        )
>> > > > +
>> > > > +        # Patch with multiple CVE IDs
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("CVE-2022-41741-CVE-2022-
>> > > > 41742.patch"),
>> > > > +            "CVE-2022-41742",
>> > > > +        )
>> > > > +
>> > > > +        # Patches with CVE ID and appended text
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("CVE-2023-3019-0001.patch"),
>> "CVE-
>> > > > 2023-3019"
>> > > > +        )
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("CVE-2024-21886-1.patch"),
>> "CVE-
>> > 2024-
>> > > > 21886"
>> > > > +        )
>> > > > +
>> > > > +        # Patch with CVE ID and prepended text
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("grep-CVE-2012-5667.patch"),
>> "CVE-
>> > > 2012-
>> > > > 5667"
>> > > > +        )
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("0001-CVE-2012-5667.patch"),
>> "CVE-
>> > > > 2012-5667"
>> > > > +        )
>> > > > +
>> > > > +        # Patch with CVE ID and both prepended and appended text
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename(
>> > > > +                "0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565=
-
>> > > 0001.patch"
>> > > > +            ),
>> > > > +            "CVE-2021-3565",
>> > > > +        )
>> > > > +
>> > > > +        # Only grab the last CVE ID in the filename
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("CVE-2012-5667-CVE-2012-
>> > > 5668.patch"),
>> > > > +            "CVE-2012-5668",
>> > > > +        )
>> > > > +
>> > > > +        # Test invalid CVE ID with incorrect length (must be at
>> least 4 digits)
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("CVE-2024-001.patch"),
>> > > > +            "",
>> > > > +        )
>> > > > +
>> > > > +        # Test valid CVE ID with very long length
>> > > > +        self.assertEqual(
>> > > > +            parse_cve_from_filename("CVE-2024-
>> > > > 0000000000000000000000001.patch"),
>> > > > +            "CVE-2024-0000000000000000000000001",
>> > > > +        )
>> > > > +
>> > > > +    def test_parse_cve_from_patch_contents(self):
>> > > > +        import textwrap
>> > > > +        from oe.cve_check import parse_cves_from_patch_contents
>> > > > +
>> > > > +        # Standard patch file excerpt without any patches
>> > > > +        self.assertEqual(
>> > > > +            parse_cves_from_patch_contents(
>> > > > +                textwrap.dedent("""\
>> > > > +            remove "*" for root since we don't have a /etc/shadow
>> so far.
>> > > > +
>> > > > +            Upstream-Status: Inappropriate [configuration]
>> > > > +
>> > > > +            Signed-off-by: Scott Garman <scott.a.garman@intel.com=
>
>> > > > +
>> > > > +            --- base-passwd/passwd.master~nobash
>> > > > +            +++ base-passwd/passwd.master
>> > > > +            @@ -1,4 +1,4 @@
>> > > > +            -root:*:0:0:root:/root:/bin/sh
>> > > > +            +root::0:0:root:/root:/bin/sh
>> > > > +            daemon:*:1:1:daemon:/usr/sbin:/bin/sh
>> > > > +            bin:*:2:2:bin:/bin:/bin/sh
>> > > > +            sys:*:3:3:sys:/dev:/bin/sh
>> > > > +            """)
>> > > > +            ),
>> > > > +            set(),
>> > > > +        )
>> > > > +
>> > > > +        # Patch file with multiple CVE IDs (space-separated)
>> > > > +        self.assertEqual(
>> > > > +            parse_cves_from_patch_contents(
>> > > > +                textwrap.dedent("""\
>> > > > +                There is an assertion in function
>> _cairo_arc_in_direction().
>> > > > +
>> > > > +                CVE: CVE-2019-6461 CVE-2019-6462
>> > > > +                Upstream-Status: Pending
>> > > > +                Signed-off-by: Ross Burton <ross.burton@intel.com=
>
>> > > > +
>> > > > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
>> > > > +                index 390397bae..1bde774a4 100644
>> > > > +                --- a/src/cairo-arc.c
>> > > > +                +++ b/src/cairo-arc.c
>> > > > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction
>> (cairo_t          *cr,
>> > > > +                    if (cairo_status (cr))
>> > > > +                        return;
>> > > > +
>> > > > +                -    assert (angle_max >=3D angle_min);
>> > > > +                +    if (angle_max < angle_min)
>> > > > +                +       return;
>> > > > +
>> > > > +                    if (angle_max - angle_min > 2 * M_PI *
>> MAX_FULL_CIRCLES) {
>> > > > +                    angle_max =3D fmod (angle_max - angle_min, 2 =
*
>> M_PI);
>> > > > +            """),
>> > > > +            ),
>> > > > +            {"CVE-2019-6461", "CVE-2019-6462"},
>> > > > +        )
>> > > > +
>> > > > +        # Patch file with multiple CVE IDs (comma-separated w/
>> both space
>> > and
>> > > > no space)
>> > > > +        self.assertEqual(
>> > > > +            parse_cves_from_patch_contents(
>> > > > +                textwrap.dedent("""\
>> > > > +                There is an assertion in function
>> _cairo_arc_in_direction().
>> > > > +
>> > > > +                CVE: CVE-2019-6461,CVE-2019-6462, CVE-2019-6463
>> > > > +                Upstream-Status: Pending
>> > > > +                Signed-off-by: Ross Burton <ross.burton@intel.com=
>
>> > > > +
>> > > > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
>> > > > +                index 390397bae..1bde774a4 100644
>> > > > +                --- a/src/cairo-arc.c
>> > > > +                +++ b/src/cairo-arc.c
>> > > > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction
>> (cairo_t          *cr,
>> > > > +                    if (cairo_status (cr))
>> > > > +                        return;
>> > > > +
>> > > > +                -    assert (angle_max >=3D angle_min);
>> > > > +                +    if (angle_max < angle_min)
>> > > > +                +       return;
>> > > > +
>> > > > +                    if (angle_max - angle_min > 2 * M_PI *
>> MAX_FULL_CIRCLES) {
>> > > > +                    angle_max =3D fmod (angle_max - angle_min, 2 =
*
>> M_PI);
>> > > > +
>> > > > +            """),
>> > > > +            ),
>> > > > +            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463"},
>> > > > +        )
>> > > > +
>> > > > +        # Patch file with multiple CVE IDs (&-separated)
>> > > > +        self.assertEqual(
>> > > > +            parse_cves_from_patch_contents(
>> > > > +                textwrap.dedent("""\
>> > > > +                There is an assertion in function
>> _cairo_arc_in_direction().
>> > > > +
>> > > > +                CVE: CVE-2019-6461 & CVE-2019-6462
>> > > > +                Upstream-Status: Pending
>> > > > +                Signed-off-by: Ross Burton <ross.burton@intel.com=
>
>> > > > +
>> > > > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
>> > > > +                index 390397bae..1bde774a4 100644
>> > > > +                --- a/src/cairo-arc.c
>> > > > +                +++ b/src/cairo-arc.c
>> > > > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction
>> (cairo_t          *cr,
>> > > > +                    if (cairo_status (cr))
>> > > > +                        return;
>> > > > +
>> > > > +                -    assert (angle_max >=3D angle_min);
>> > > > +                +    if (angle_max < angle_min)
>> > > > +                +       return;
>> > > > +
>> > > > +                    if (angle_max - angle_min > 2 * M_PI *
>> MAX_FULL_CIRCLES) {
>> > > > +                    angle_max =3D fmod (angle_max - angle_min, 2 =
*
>> M_PI);
>> > > > +            """),
>> > > > +            ),
>> > > > +            {"CVE-2019-6461", "CVE-2019-6462"},
>> > > > +        )
>> > > > +
>> > > > +        # Patch file with multiple lines with CVE IDs
>> > > > +        self.assertEqual(
>> > > > +            parse_cves_from_patch_contents(
>> > > > +                textwrap.dedent("""\
>> > > > +                There is an assertion in function
>> _cairo_arc_in_direction().
>> > > > +
>> > > > +                CVE: CVE-2019-6461 & CVE-2019-6462
>> > > > +
>> > > > +                CVE: CVE-2019-6463 & CVE-2019-6464
>> > > > +                Upstream-Status: Pending
>> > > > +                Signed-off-by: Ross Burton <ross.burton@intel.com=
>
>> > > > +
>> > > > +                diff --git a/src/cairo-arc.c b/src/cairo-arc.c
>> > > > +                index 390397bae..1bde774a4 100644
>> > > > +                --- a/src/cairo-arc.c
>> > > > +                +++ b/src/cairo-arc.c
>> > > > +                @@ -186,7 +186,8 @@ _cairo_arc_in_direction
>> (cairo_t          *cr,
>> > > > +                    if (cairo_status (cr))
>> > > > +                        return;
>> > > > +
>> > > > +                -    assert (angle_max >=3D angle_min);
>> > > > +                +    if (angle_max < angle_min)
>> > > > +                +       return;
>> > > > +
>> > > > +                    if (angle_max - angle_min > 2 * M_PI *
>> MAX_FULL_CIRCLES) {
>> > > > +                    angle_max =3D fmod (angle_max - angle_min, 2 =
*
>> M_PI);
>> > > > +
>> > > > +            """),
>> > > > +            ),
>> > > > +            {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463",
>> "CVE-
>> > > > 2019-6464"},
>> > > > +        )
>> > > >
>> > > >      def test_recipe_report_json(self):
>> > > >          config =3D """
>> > > > --
>> > > > 2.34.1
>>
>>

--000000000000ecb3b3062b7006f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Actually, the test I added was wrong, I was asserting=
 equal to set(&quot;CVE-2023-33460&quot;) instead of {&quot;CVE-2023-33460&=
quot;} in my test case.</div><div><br>Back=C2=A0to square one...</div><div>=
<br></div><div>Colin</div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 11, 2025 at 9:2=
5=E2=80=AFAM Colin &lt;<a href=3D"mailto:colinmca242@gmail.com">colinmca242=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div>Hi Peter,</div><div><br>I&#39;m currently =
looking at this. I added CVE-2023-33460.patch to test_parse_cve_from_patch_=
contents and ran oe-selftest. I see the issue why these patches are no long=
er being marked as solved.</div><div><br></div><div>2025-01-11 15:17:33,396=
 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D<br>2025-01-11 15:17:33,396 - oe-selftest - INFO - FAIL: test_pars=
e_cve_from_patch_contents (cve_check.CVECheck)<br>2025-01-11 15:17:33,397 -=
 oe-selftest - INFO - -----------------------------------------------------=
-----------------<br>2025-01-11 15:17:33,397 - oe-selftest - INFO - Traceba=
ck (most recent call last):<br>=C2=A0 File &quot;/home/colin/development/yo=
cto/poky/meta/lib/oeqa/selftest/cases/cve_check.py&quot;, line 209, in test=
_parse_cve_from_patch_contents<br>=C2=A0 =C2=A0 self.assertEqual(<br>Assert=
ionError: Items in the first set but not the second:<br>&#39;CVE-2023-33460=
&#39;<br>Items in the second set but not the first:<br>&#39;E&#39;<br>&#39;=
2&#39;<br>&#39;V&#39;<br>&#39;C&#39;<br>&#39;-&#39;<br>&#39;0&#39;<br>&#39;=
4&#39;<br>&#39;3&#39;<br>&#39;6&#39;<br><br>2025-01-11 15:17:33,397 - oe-se=
lftest - INFO - -----------------------------------------------------------=
-----------<br>2025-01-11 15:17:33,397 - oe-selftest - INFO - Ran 1 test in=
 0.247s<br>2025-01-11 15:17:33,398 - oe-selftest - INFO - FAILED<br>2025-01=
-11 15:17:33,398 - oe-selftest - INFO - =C2=A0(failures=3D1)<br>2025-01-11 =
15:17:46,988 - oe-selftest - INFO - RESULTS:<br>2025-01-11 15:17:46,988 - o=
e-selftest - INFO - RESULTS - cve_check.CVECheck.test_parse_cve_from_patch_=
contents: FAILED (0.02s)<br>2025-01-11 15:17:46,996 - oe-selftest - INFO - =
SUMMARY:<br>2025-01-11 15:17:46,996 - oe-selftest - INFO - oe-selftest () -=
 Ran 1 test in 0.249s<br>2025-01-11 15:17:46,996 - oe-selftest - INFO - oe-=
selftest - FAIL - Required tests failed (successes=3D0, skipped=3D0, failur=
es=3D1, errors=3D0)</div><div><br></div>For some reason the CVE string itse=
lf is getting put into a set, instead of the full string being placed into =
a set. I&#39;ll track down where this is happening and push up a fix, inclu=
ding adding this update to the test.<div><br></div><div>Not sure why I didn=
&#39;t add a test case with a single CVE ID in the patch contents...This wa=
s my mistake and I apologize. Sorry for any inconveniences I caused.</div><=
div><br></div><div>Best,</div><div>Colin</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 10, 2025 at 3:26=
=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com" tar=
get=3D"_blank">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Looking at the reopened CVEs in meta-=
oe, I can&#39;t understand why are some reported.<br>
<br>
$ grep -rI CVE-2023-33460 ./<br>
./meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch:CVE: CVE-2023-334=
60<br>
./meta-oe/recipes-devtools/yajl/<a href=3D"http://yajl_2.1.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">yajl_2.1.0.bb</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file://CVE-2023-33460.patch \<br>
$ grep -rI CVE-2020-29074 ./<br>
./meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch:CVE: CVE-2020-=
29074<br>
./meta-oe/recipes-graphics/x11vnc/<a href=3D"http://x11vnc_0.9.16.bb" rel=
=3D"noreferrer" target=3D"_blank">x11vnc_0.9.16.bb</a>:=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-29074.patch \<br>
<br>
These look good to me, but they are not matched anymore and show as open.<b=
r>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Peter Marko via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Friday, January 10, 2025 10:21<br>
&gt; To: <a href=3D"mailto:colinmca242@gmail.com" target=3D"_blank">colinmc=
a242@gmail.com</a>; <a href=3D"mailto:openembedded-core@lists.openembedded.=
org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch parsing<=
br>
&gt; <br>
&gt; Or should we rather rename all those patches which violate current cod=
e?<br>
&gt; What is then the meaning of CVE: tag within the patch if it&#39;s not =
used but it&#39;s<br>
&gt; enforced?<br>
&gt; We should probably remove cve_payload_tag handling from<br>
&gt; test_cve_tag_format...<br>
&gt; <br>
&gt; Peter<br>
&gt; <br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openemb=
edded-<br>
&gt; &gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">=
core@lists.openembedded.org</a>&gt; On Behalf Of Peter Marko via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; Sent: Friday, January 10, 2025 9:34<br>
&gt; &gt; To: <a href=3D"mailto:colinmca242@gmail.com" target=3D"_blank">co=
linmca242@gmail.com</a>; openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a><br>
&gt; &gt; Subject: Re: [OE-core] [PATCH v2 1/1] cve-check: Rework patch par=
sing<br>
&gt; &gt;<br>
&gt; &gt; Hello,<br>
&gt; &gt;<br>
&gt; &gt; This patch has caused a regression in detecting cve patches.<br>
&gt; &gt; Master jumped by 32 CVEs after merging this commit.<br>
&gt; &gt; These are for sure patched but it&#39;s not detected anymore.<br>
&gt; &gt; See <a href=3D"https://valkyrie.yocto.io/pub/non-release/patchmet=
rics/" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yocto.io/pub/n=
on-release/patchmetrics/</a><br>
&gt; &gt; (master should be identical to scarthgap/styhead except for kerne=
l CVEs)<br>
&gt; &gt;<br>
&gt; &gt; Reports cannot be used anymore for picking CVEs for TODO list.<br=
>
&gt; &gt; So this patch should be reverted or fixed.<br>
&gt; &gt;<br>
&gt; &gt; Peter<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded=
.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;op=
enembedded-<br>
&gt; &gt; &gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_bl=
ank">core@lists.openembedded.org</a>&gt; On Behalf Of Colin McAllister via<=
br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer"=
 target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; Sent: Monday, December 30, 2024 20:22<br>
&gt; &gt; &gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.o=
rg" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; &gt; Cc: Colin McAllister &lt;<a href=3D"mailto:colinmca242@gmail=
.com" target=3D"_blank">colinmca242@gmail.com</a>&gt;<br>
&gt; &gt; &gt; Subject: [OE-core] [PATCH v2 1/1] cve-check: Rework patch pa=
rsing<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The cve_check functionality to parse CVE IDs from the patch =
filename and<br>
&gt; &gt; &gt; patch contents have been reworked to improve parsing and als=
o utilize<br>
&gt; &gt; &gt; tests. This ensures that the parsing works as intended.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Additionally, the new patched_cves dict has a few issues I t=
ried to fix<br>
&gt; &gt; &gt; as well. If multiple patch files exist for a single CVE ID, =
only the<br>
&gt; &gt; &gt; last one will show up with the &quot;resource&quot; key. The=
 value for the<br>
&gt; &gt; &gt; &quot;resource&quot; key has been updated to hold a list and=
 return all patch<br>
&gt; &gt; &gt; files associated with a given CVE ID. Also, at the end of<br=
>
&gt; &gt; &gt; get_patch_cves, CVE_STATUS can overwrite an existing entry i=
n the dict.<br>
&gt; &gt; &gt; This could cause an issue, for example, if a CVE has been ad=
dressed via<br>
&gt; &gt; &gt; a patch, but a CVE_STATUS line also exists that ignores the =
given CVE<br>
&gt; &gt; &gt; ID. A warning has been added if this ever happens.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Colin McAllister &lt;<a href=3D"mailto:colinm=
ca242@gmail.com" target=3D"_blank">colinmca242@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I noticed that there are some patches, especially in older v=
erisons of<br>
&gt; &gt; &gt; Yocto, where the &quot;CVE: &quot; tag was used with multipl=
e CVE IDs in different<br>
&gt; &gt; &gt; formats, like &quot;CVE-YYYY-XXXX &amp; CVE-YYYY-XXXX&quot; =
or<br>
&gt; &gt; &gt; &quot;CVE-YYYY-XXXX, CVE-YYYY-XXXX&quot;. Currently, only sp=
ace-delimited CVE<br>
&gt; &gt; &gt; IDs will be parsed, but documentation doesn&#39;t indicate t=
hat is the only<br>
&gt; &gt; &gt; supported format. I figured it&#39;d be nice to update the c=
ode to be able<br>
&gt; &gt; &gt; to support multiple formats, that way this patch could be ba=
ckported to<br>
&gt; &gt; &gt; fix those patches. I also wanted to add unit tests to ensure=
 the patch<br>
&gt; &gt; &gt; parsing behavior is preserved.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;d also like to update the patch filename parsing to pa=
rse multiple CVE<br>
&gt; &gt; &gt; IDs from the filename, but based on the comments, it seems l=
ike there<br>
&gt; &gt; &gt; was a reason why only the last CVE ID is extracted from the =
filename.<br>
&gt; &gt; &gt; I&#39;d be happy to submit a V2 patch or an additional patch=
 to update the<br>
&gt; &gt; &gt; function if that sounds good for the maintainers.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; V2 Changes:<br>
&gt; &gt; &gt; I mistakenly created this patch without fb3f440 applied. I u=
pdated<br>
&gt; &gt; &gt; get_patched_cves to return a dict instead of a set.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I also improved the docstrings for these new functions to be=
 more<br>
&gt; &gt; &gt; descriptive and also specify the return types.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I also found a few issues with the dictionary object created=
 by<br>
&gt; &gt; &gt; get_patched_cves that have now been addressed in this commit=
.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 meta/lib/oe/cve_check.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 166 ++++++++++++------<br>
&gt; &gt; &gt;=C2=A0 meta/lib/oeqa/selftest/cases/cve_check.py | 205<br>
&gt; &gt; &gt; ++++++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 317 insertions(+), 54 deletions(-)<br=
>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_chec=
k.py<br>
&gt; &gt; &gt; index 280f9f613d..85a899a880 100644<br>
&gt; &gt; &gt; --- a/meta/lib/oe/cve_check.py<br>
&gt; &gt; &gt; +++ b/meta/lib/oe/cve_check.py<br>
&gt; &gt; &gt; @@ -5,9 +5,11 @@<br>
&gt; &gt; &gt;=C2=A0 #<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 import collections<br>
&gt; &gt; &gt; -import re<br>
&gt; &gt; &gt; -import itertools<br>
&gt; &gt; &gt;=C2=A0 import functools<br>
&gt; &gt; &gt; +import itertools<br>
&gt; &gt; &gt; +import os.path<br>
&gt; &gt; &gt; +import re<br>
&gt; &gt; &gt; +import oe.patch<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 _Version =3D collections.namedtuple(<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;_Version&quot;, [&quot;release&quo=
t;, &quot;patch_l&quot;, &quot;pre_l&quot;, &quot;pre_v&quot;]<br>
&gt; &gt; &gt; @@ -71,76 +73,132 @@ def _cmpkey(release, patch_l, pre_l, pr=
e_v):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return _release, _patch, _pre<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -def get_patched_cves(d):<br>
&gt; &gt; &gt; +def parse_cve_from_filename(patch_filename):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 Get patches that solve CVEs using the &quot;C=
VE: &quot; tag.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Parses CVE ID from the filename<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Matches the last &quot;CVE-YYYY-ID&quot; in t=
he file name, also if written<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 in lowercase. Possible to have multiple CVE I=
Ds in a single<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 file name, but only the last one will be dete=
cted from the file name.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Returns the last CVE ID foudn in the filename=
. If no CVE ID is found<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 an empty string is returned.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 cve_file_name_match =3D re.compile(r&quot;.*(=
CVE-\d{4}-\d{4,})&quot;,<br>
&gt; &gt; &gt; re.IGNORECASE)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 import re<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 import oe.patch<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 # Check patch file name for CVE ID<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 fname_match =3D cve_file_name_match.search(pa=
tch_filename)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return fname_match.group(1).upper() if fname_=
match else &quot;&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 cve_match =3D re.compile(r&quot;CVE:( CVE-\d{=
4}-\d+)+&quot;)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 # Matches the last &quot;CVE-YYYY-ID&quot; in=
 the file name, also if written<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 # in lowercase. Possible to have multiple CVE=
 IDs in a single<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 # file name, but only the last one will be de=
tected from the file name.<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 # However, patch files contents addressing mu=
ltiple CVE IDs are<br>
&gt; &gt; supported<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 # (cve_match regular expression)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 cve_file_name_match =3D re.compile(r&quot;.*(=
CVE-\d{4}-\d+)&quot;,<br>
&gt; &gt; re.IGNORECASE)<br>
&gt; &gt; &gt; +def parse_cves_from_patch_contents(patch_contents):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Parses CVE IDs from patch contents<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Matches all CVE IDs contained on a line that =
starts with &quot;CVE: &quot;. Any<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 delimiter (&#39;,&#39;, &#39;&amp;&#39;, &quo=
t;and&quot;, etc.) can be used without any issues. Multiple<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;CVE:&quot; lines can also exist.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Returns a set of all CVE IDs found in the pat=
ch contents.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 cve_ids =3D set()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 cve_match =3D re.compile(r&quot;CVE-\d{4}-\d{=
4,}&quot;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 # Search for one or more &quot;CVE: &quot; li=
nes<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 for line in patch_contents.split(&quot;\n&quo=
t;):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not line.startswith(&quot;CV=
E:&quot;):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_ids.update(cve_match.findal=
l(line))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return cve_ids<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +def parse_cves_from_patch_file(patch_file):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Parses CVE IDs associated with a particular p=
atch file, using both the<br>
&gt; &gt; &gt; filename<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 and patch contents.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Returns a set of all CVE IDs found in the pat=
ch filename and contents.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 cve_ids =3D set()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 filename_cve =3D parse_cve_from_filename(patc=
h_file)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if filename_cve:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;Found %s from=
 patch file name %s&quot; % (filename_cve,<br>
&gt; &gt; &gt; patch_file))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_ids.add(parse_cve_from_file=
name(patch_file))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 # Remote patches won&#39;t be present and com=
pressed patches won&#39;t be<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 # unpacked, so say we&#39;re not scanning the=
m<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if not os.path.isfile(patch_file):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s is remote or c=
ompressed, not scanning content&quot; %<br>
&gt; &gt; &gt; patch_file)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cve_ids<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 with open(patch_file, &quot;r&quot;, encoding=
=3D&quot;utf-8&quot;) as f:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_text =3D f.=
read()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except UnicodeDecodeError:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1,<=
br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;Failed to read patch %s using UTF-8 encoding&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot; trying with iso8859-1&quot; % patch_file,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.close()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(patch_f=
ile, &quot;r&quot;, encoding=3D&quot;iso8859-1&quot;) as f:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pat=
ch_text =3D f.read()<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 cve_ids.update(parse_cves_from_patch_contents=
(patch_text))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 if not cve_ids:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;Patch %s does=
n&#39;t solve CVEs&quot; % patch_file)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;Patch %s solv=
es %s&quot; % (patch_file, &quot;,<br>
&gt; &gt; &gt; &quot;.join(sorted(cve_ids))))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 return cve_ids<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +def get_patched_cves(d):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Determines the CVE IDs that have been solved =
by either patches<br>
&gt; incuded<br>
&gt; &gt; &gt; within<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 SRC_URI or by setting CVE_STATUS.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 Returns a dictionary with the CVE IDs as keys=
 and an associated<br>
&gt; dictonary<br>
&gt; &gt; &gt; of<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 relevant metadata as the value.<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 patched_cves =3D {}<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 patches =3D oe.patch.src_patches(d)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot;Scanning %d patches fo=
r CVEs&quot; % len(patches))<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 # Check each patch file<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 for url in patches:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch_file =3D bb.fetch.de=
codeurl(url)[2]<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check patch file name for CVE=
 ID<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 fname_match =3D cve_file_name_m=
atch.search(patch_file)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if fname_match:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve =3D fname_mat=
ch.group(1).upper()<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patched_cves[cve]=
 =3D {&quot;abbrev-status&quot;: &quot;Patched&quot;, &quot;status&quot;: &=
quot;fix-file-<br>
&gt; &gt; &gt; included&quot;, &quot;resource&quot;: patch_file}<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot=
;Found %s from patch file name %s&quot; % (cve,<br>
&gt; patch_file))<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remote patches won&#39;t be p=
resent and compressed patches won&#39;t be<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # unpacked, so say we&#39;re no=
t scanning them<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isfile(patch_fil=
e):<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s =
is remote or compressed, not scanning content&quot; %<br>
&gt; &gt; &gt; patch_file)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(patch_file, &quot;r&q=
uot;, encoding=3D&quot;utf-8&quot;) as f:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pat=
ch_text =3D f.read()<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except UnicodeDec=
odeError:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.=
debug(1, &quot;Failed to read patch %s using UTF-8 encoding&quot;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot; trying with iso8859-1&quot; %=C2=A0 patch_f=
ile)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.c=
lose()<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wit=
h open(patch_file, &quot;r&quot;, encoding=3D&quot;iso8859-1&quot;) as f:<b=
r>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 patch_text =3D f.read()<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Search for one or more &quot;=
CVE: &quot; lines<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 text_match =3D False<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for match in cve_match.finditer=
(patch_text):<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Get only the CV=
Es without the &quot;CVE: &quot; tag<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cves =3D patch_te=
xt[match.start()+5:match.end()]<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve in cves.s=
plit():<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.=
debug(2, &quot;Patch %s solves %s&quot; % (patch_file, cve))<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pat=
ched_cves[cve] =3D {&quot;abbrev-status&quot;: &quot;Patched&quot;, &quot;s=
tatus&quot;: &quot;fix-<br>
&gt; file-<br>
&gt; &gt; &gt; included&quot;, &quot;resource&quot;: patch_file}<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tex=
t_match =3D True<br>
&gt; &gt; &gt; -<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not fname_match and not text=
_match:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(2, &quot=
;Patch %s doesn&#39;t solve CVEs&quot; % patch_file)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve_id in parse_cves_from_p=
atch_file(patch_file):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve_id not in =
patched_cves:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;abbrev-status&quot;: &quot;Patched&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;status&quot;: &quot;fix-file-included&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;resource&quot;: [patch_file],<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pat=
ched_cves[cve_id][&quot;resource&quot;].append(patch_file)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Search for additional patched CVEs<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 for cve in (d.getVarFlags(&quot;CVE_STATUS&qu=
ot;) or {}):<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status =3D decode_cve_s=
tatus(d, cve)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 for cve_id in d.getVarFlags(&quot;CVE_STATUS&=
quot;) or {}:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status =3D decode_cve_s=
tatus(d, cve_id)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 products =3D d.getVar(&quo=
t;CVE_PRODUCT&quot;)<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if has_cve_product_match(decode=
d_status, products) =3D=3D True:<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patched_cves[cve]=
 =3D {<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if has_cve_product_match(decode=
d_status, products):<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve_id in patc=
hed_cves:<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.=
warn(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;CVE_STATUS[%s] =3D &quot;%s&quot; is overwriting previous s=
tatus of &quot;%s:<br>
&gt; &gt; %s&quot;&#39;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 % (<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cve_id,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 d.getVarFlag(&quot;CVE_STATUS&quot;, cve_id),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 patched_cves[cve_id][&quot;abbrev-status&quot;],<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 patched_cves[cve_id][&quot;status&quot;],<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 )<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patched_cves[cve_=
id] =3D {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;abbrev-status&quot;: decoded_status[&quot;mapping&quot;],<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;status&quot;: decoded_status[&quot;detail&quot;],<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;justification&quot;: decoded_status[&quot;description&quot;],<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;affected-vendor&quot;: decoded_status[&quot;vendor&quot;],<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;affected-product&quot;: decoded_status[&quot;product&quot;]<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;affected-product&quot;: decoded_status[&quot;product&quot;],<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 return patched_cves<br>
&gt; &gt; &gt; diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py<br>
&gt; &gt; &gt; b/meta/lib/oeqa/selftest/cases/cve_check.py<br>
&gt; &gt; &gt; index 3dd3e89d3e..511e4b81b4 100644<br>
&gt; &gt; &gt; --- a/meta/lib/oeqa/selftest/cases/cve_check.py<br>
&gt; &gt; &gt; +++ b/meta/lib/oeqa/selftest/cases/cve_check.py<br>
&gt; &gt; &gt; @@ -120,6 +120,211 @@ class CVECheck(OESelftestTestCase):<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(has_cve_p=
roduct_match(status, &quot;test glibca:glibc&quot;),<br>
&gt; &gt; True)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(has_cve_p=
roduct_match(status, &quot;glibca:glibc test&quot;),<br>
&gt; &gt; True)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def test_parse_cve_from_patch_filename(self):=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 from oe.cve_check import parse_=
cve_from_filename<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch filename without CVE ID=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(parse_cve_from=
_filename(&quot;0001-test.patch&quot;), &quot;&quot;)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch with single CVE ID<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;CVE-2022-12345.patch&quot;), &quot;CVE-2022-<br>
&gt; &gt; &gt; 12345&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch with multiple CVE IDs<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;CVE-2022-41741-CVE-2022-<br>
&gt; &gt; &gt; 41742.patch&quot;),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CVE-2022-41=
742&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patches with CVE ID and appen=
ded text<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;CVE-2023-3019-0001.patch&quot;), &quot;CVE-<br>
&gt; &gt; &gt; 2023-3019&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;CVE-2024-21886-1.patch&quot;), &quot;CVE-<br>
&gt; 2024-<br>
&gt; &gt; &gt; 21886&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch with CVE ID and prepend=
ed text<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;grep-CVE-2012-5667.patch&quot;), &quot;CVE-<br>
&gt; &gt; 2012-<br>
&gt; &gt; &gt; 5667&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;0001-CVE-2012-5667.patch&quot;), &quot;CVE-<br>
&gt; &gt; &gt; 2012-5667&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch with CVE ID and both pr=
epended and appended text<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565-<br>
&gt; &gt; 0001.patch&quot;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CVE-2021-35=
65&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Only grab the last CVE ID in =
the filename<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;CVE-2012-5667-CVE-2012-<br>
&gt; &gt; 5668.patch&quot;),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CVE-2012-56=
68&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test invalid CVE ID with inco=
rrect length (must be at least 4 digits)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;CVE-2024-001.patch&quot;),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Test valid CVE ID with very l=
ong length<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cve_from_fi=
lename(&quot;CVE-2024-<br>
&gt; &gt; &gt; 0000000000000000000000001.patch&quot;),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;CVE-2024-00=
00000000000000000000001&quot;,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 def test_parse_cve_from_patch_contents(self):=
<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import textwrap<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 from oe.cve_check import parse_=
cves_from_patch_contents<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Standard patch file excerpt w=
ithout any patches<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cves_from_p=
atch_contents(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tex=
twrap.dedent(&quot;&quot;&quot;\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove &quot;*&qu=
ot; for root since we don&#39;t have a /etc/shadow so far.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Upstream-Status: =
Inappropriate [configuration]<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Signed-off-by: Sc=
ott Garman &lt;<a href=3D"mailto:scott.a.garman@intel.com" target=3D"_blank=
">scott.a.garman@intel.com</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --- base-passwd/p=
asswd.master~nobash<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +++ base-passwd/p=
asswd.master<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ -1,4 +1,4 @@<b=
r>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -root:*:0:0:root:=
/root:/bin/sh<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +root::0:0:root:/=
root:/bin/sh<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 daemon:*:1:1:daem=
on:/usr/sbin:/bin/sh<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bin:*:2:2:bin:/bi=
n:/bin/sh<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys:*:3:3:sys:/de=
v:/bin/sh<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot=
;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set(),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch file with multiple CVE =
IDs (space-separated)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cves_from_p=
atch_contents(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tex=
twrap.dedent(&quot;&quot;&quot;\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The=
re is an assertion in function _cairo_arc_in_direction().<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CVE=
: CVE-2019-6461 CVE-2019-6462<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ups=
tream-Status: Pending<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sig=
ned-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dif=
f --git a/src/cairo-arc.c b/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ind=
ex 390397bae..1bde774a4 100644<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ---=
 a/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +++=
 b/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ =
-186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *cr,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (cairo_status (cr))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
=C2=A0 =C2=A0 assert (angle_max &gt;=3D angle_min);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=C2=A0 =C2=A0 if (angle_max &lt; angle_min)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (angle_max - angle_min &gt; 2 * M_PI * MAX_FULL_CIRCLES) {<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot=
;),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;CVE-2019-6=
461&quot;, &quot;CVE-2019-6462&quot;},<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch file with multiple CVE =
IDs (comma-separated w/ both space<br>
&gt; and<br>
&gt; &gt; &gt; no space)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cves_from_p=
atch_contents(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tex=
twrap.dedent(&quot;&quot;&quot;\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The=
re is an assertion in function _cairo_arc_in_direction().<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CVE=
: CVE-2019-6461,CVE-2019-6462, CVE-2019-6463<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ups=
tream-Status: Pending<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sig=
ned-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dif=
f --git a/src/cairo-arc.c b/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ind=
ex 390397bae..1bde774a4 100644<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ---=
 a/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +++=
 b/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ =
-186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *cr,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (cairo_status (cr))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
=C2=A0 =C2=A0 assert (angle_max &gt;=3D angle_min);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=C2=A0 =C2=A0 if (angle_max &lt; angle_min)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (angle_max - angle_min &gt; 2 * M_PI * MAX_FULL_CIRCLES) {<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot=
;),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;CVE-2019-6=
461&quot;, &quot;CVE-2019-6462&quot;, &quot;CVE-2019-6463&quot;},<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch file with multiple CVE =
IDs (&amp;-separated)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cves_from_p=
atch_contents(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tex=
twrap.dedent(&quot;&quot;&quot;\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The=
re is an assertion in function _cairo_arc_in_direction().<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CVE=
: CVE-2019-6461 &amp; CVE-2019-6462<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ups=
tream-Status: Pending<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sig=
ned-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dif=
f --git a/src/cairo-arc.c b/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ind=
ex 390397bae..1bde774a4 100644<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ---=
 a/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +++=
 b/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ =
-186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *cr,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (cairo_status (cr))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
=C2=A0 =C2=A0 assert (angle_max &gt;=3D angle_min);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=C2=A0 =C2=A0 if (angle_max &lt; angle_min)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (angle_max - angle_min &gt; 2 * M_PI * MAX_FULL_CIRCLES) {<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot=
;),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;CVE-2019-6=
461&quot;, &quot;CVE-2019-6462&quot;},<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Patch file with multiple line=
s with CVE IDs<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 parse_cves_from_p=
atch_contents(<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tex=
twrap.dedent(&quot;&quot;&quot;\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 The=
re is an assertion in function _cairo_arc_in_direction().<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CVE=
: CVE-2019-6461 &amp; CVE-2019-6462<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CVE=
: CVE-2019-6463 &amp; CVE-2019-6464<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ups=
tream-Status: Pending<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sig=
ned-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dif=
f --git a/src/cairo-arc.c b/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ind=
ex 390397bae..1bde774a4 100644<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ---=
 a/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +++=
 b/src/cairo-arc.c<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @@ =
-186,7 +186,8 @@ _cairo_arc_in_direction (cairo_t=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *cr,<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (cairo_status (cr))<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=
=C2=A0 =C2=A0 assert (angle_max &gt;=3D angle_min);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=C2=A0 =C2=A0 if (angle_max &lt; angle_min)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (angle_max - angle_min &gt; 2 * M_PI * MAX_FULL_CIRCLES) {<br=
>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 angle_max =3D fmod (angle_max - angle_min, 2 * M_PI);<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot=
;),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ),<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {&quot;CVE-2019-6=
461&quot;, &quot;CVE-2019-6462&quot;, &quot;CVE-2019-6463&quot;, &quot;CVE-=
<br>
&gt; &gt; &gt; 2019-6464&quot;},<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 def test_recipe_report_json(self):<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &quot;&quot;&qu=
ot;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.34.1<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000ecb3b3062b7006f1--

