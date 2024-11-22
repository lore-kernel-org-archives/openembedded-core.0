Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F07AE65D18
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 03:04:23 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.16536.1732244660341708963
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 19:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iGTQYbEV;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-71807ad76a8so832113a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 19:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732244659; x=1732849459; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IdqfG2QwhNECqA8WQ0ntFL6J8jMfnf5yuCaqWGjxYbY=;
        b=iGTQYbEVO4+mcOTKdmQJESPN/AZ+2oOG3LD9AV2E2SNL1OCROzw/ILblxt3eyf/okW
         4NzRRF3EOUIkvp8eZUUrTy7DvE5PUPAY91xVUEWcv0ORggT99NUyujO9JCUKsjL3vu/Z
         xm4CfwnI9hVn2oWgyqZQJ8VG6x+FrMvJzw9tP6RaTNtwx0DHF7jZbNcwo4lBxWn72NeV
         sPepFFtIwQo4qSZkiKiPViqpsAHYDdccoBNlLSVzIZ+M3ko2eBb2LF2D7LU8Js7Z1BU0
         zNn7qkQS5f3khi/0tBTL5PuqJnkegS2Czdp0FjUD2F8noFCNsJEHWvDi5bfhReeE376Z
         ezTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732244659; x=1732849459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IdqfG2QwhNECqA8WQ0ntFL6J8jMfnf5yuCaqWGjxYbY=;
        b=MVzOuHCngL1y1GOffLjLbo3G1+HN5UsntD0gYVShKB/xS/EwwXCrLfm0/gEaJDCWod
         yFtngNCZSkcVTOnW+M5FFfrMH8Xp7FdJ/waUKGsRErxC0jOi8Dt++ON7l94Ic8TOxsp2
         0Zf8IBBJCxnfrjwb7OD/hLJs8aEcMxWfTtDXrCcszOD4GZCnuxX6ZBUMMIk4rJE+CAlV
         B7NFNcsivTB0vr2oBtwq/Aydif8KVYfz5pNeaWd6GVTkXswNRpnQ6ATmEVDsIYHRmMN2
         ZpF14sXTY1BJal3/H+mFcny2itOI3EHHAArVBPpkrbc0VQZkMUc7lqcMkbTBUmjw9ppn
         0WoA==
X-Gm-Message-State: AOJu0YxqpvCY2+3BmAd45gyWGifdl4LnDrOYfWb7M0h8e0AXSTVFVvLK
	DeGkTHkKYXmpnVFNmJLnz+9nF71znFIQPiZP8isG55xmxEM/6DfdhT96IkJq7/sN9JgS8HYrF5e
	kHm7YVs3If8fRs9pf0Ifk0FQe9FM=
X-Gm-Gg: ASbGncsYGY4scaEFGdjBweTv3O5fgv11aWskwr/vLHomit/kjTaKGaJVTCuKlIwpM45
	dMCQSlhYCkWYZYmQumlWZG4uHxrfly0eyb7c2LRWddSWl7Yl8MXlpfevaCkwQR9VB
X-Google-Smtp-Source: AGHT+IHMtd1uGT2GrHShpizXcI727i33DXC5W5U3bwmsaMtnBQPXO1abOTxpGF4JzLjXV4LGFTntian5ZxPhWjLRttE=
X-Received: by 2002:a9d:6e81:0:b0:718:162e:7712 with SMTP id
 46e09a7af769-71c04ba43f8mr1277687a34.14.1732244657830; Thu, 21 Nov 2024
 19:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20241122012941.3055-1-f_l_k@t-online.de>
In-Reply-To: <20241122012941.3055-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2024 19:04:06 -0800
Message-ID: <CAMKF1sokg5vHatwE6+Ac17JZSXU65cHTV9ddkMZ8MGtftyfJcA@mail.gmail.com>
Subject: Re: [oe-core][PATCH] gcc: add a backport patch to fix an issue with
 tzdata 2024b
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007e80c8062777a32f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 03:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207587

--0000000000007e80c8062777a32f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch is fine however I would suggest to remove the hunk changing
changellog files it will make it easy to backport

On Thu, Nov 21, 2024 at 5:30=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> There is an issue in the std::chrono::tzdb parser that causes problems
> since the tzdata-2024b release started using %z in the main format.
>
> As a real world problem I encounter an issue with the waybar clock module=
,
> which ignores the timezone setting and only shows system time.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
>  ...4fffe3fc82a710bea66ad651720d71c938b8.patch | 567 ++++++++++++++++++
>  2 files changed, 568 insertions(+)
>  create mode 100644
> meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d71c=
938b8.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc
> b/meta/recipes-devtools/gcc/gcc-14.2.inc
> index f05484cfc0..9cfb246294 100644
> --- a/meta/recipes-devtools/gcc/gcc-14.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
> @@ -68,6 +68,7 @@ SRC_URI =3D "${BASEURI} \
>             file://0023-Fix-install-path-of-linux64.h.patch \
>             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch=
 \
>             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
> +           file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch=
 \
>  "
>
>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
> diff --git
> a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d7=
1c938b8.patch
> b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d7=
1c938b8.patch
> new file mode 100644
> index 0000000000..ca6fc92e07
> --- /dev/null
> +++
> b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720d7=
1c938b8.patch
> @@ -0,0 +1,567 @@
> +From ab884fffe3fc82a710bea66ad651720d71c938b8 Mon Sep 17 00:00:00 2001
> +From: Jonathan Wakely <jwakely@redhat.com>
> +Date: Tue, 30 Apr 2024 09:52:13 +0100
> +Subject: [PATCH] libstdc++: Fix std::chrono::tzdb to work with vanguard
> format
> +
> +I found some issues in the std::chrono::tzdb parser by testing the
> +tzdata "vanguard" format, which uses new features that aren't enabled in
> +the "main" and "rearguard" data formats.
> +
> +Since 2024a the keyword "minimum" is no longer valid for the FROM and TO
> +fields in a Rule line, which means that "m" is now a valid abbreviation
> +for "maximum". Previously we expected either "mi" or "ma". For backwards
> +compatibility, a FROM field beginning with "mi" is still supported and
> +is treated as 1900. The "maximum" keyword is only allowed in TO now,
> +because it makes no sense in FROM. To support these changes the
> +minmax_year and minmax_year2 classes for parsing FROM and TO are
> +replaced with a single years_from_to class that reads both fields.
> +
> +The vanguard format makes use of %z in Zone FORMAT fields, which caused
> +an exception to be thrown from ZoneInfo::set_abbrev because no % or /
> +characters were expected when a Zone doesn't use a named Rule. The
> +ZoneInfo::to(sys_info&) function now uses format_abbrev_str to replace
> +any %z with the current offset. Although format_abbrev_str also checks
> +for %s and STD/DST formats, those only make sense when a named Rule is
> +in effect, so won't occur when ZoneInfo::to(sys_info&) is used.
> +
> +Since making this change on trunk, the tzdata-2024b release started
> +using %z in the main format, not just vanguard. This makes a backport to
> +release branches necessary (see PR 116657).
> +
> +This change also implements a feature that has always been missing from
> +time_zone::_M_get_sys_info: finding the Rule that is active before the
> +specified time point, so that we can correctly handle %s in the FORMAT
> +for the first new sys_info that gets created. This requires implementing
> +a poorly documented feature of zic, to get the LETTERS field from a
> +later transition, as described at
> +https://mm.icann.org/pipermail/tz/2024-April/058891.html
> +In order for this to work we need to be able to distinguish an empty
> +letters field (as used by CE%sT where the variable part is either empty
> +or "S") from "the letters field is not known for this transition". The
> +tzdata file uses "-" for an empty letters field, which libstdc++ was
> +previously replacing with "" when the Rule was parsed. Instead, we now
> +preserve the "-" in the Rule object, so that "" can be used for the case
> +where we don't know the letters (and so need to decide it).
> +
> +libstdc++-v3/ChangeLog:
> +
> +       * src/c++20/tzdb.cc (minmax_year, minmax_year2): Remove.
> +       (years_from_to): New class replacing minmax_year and
> +       minmax_year2.
> +       (format_abbrev_str, select_std_or_dst_abbrev): Move earlier in
> +       the file. Handle "-" for letters.
> +       (ZoneInfo::to): Use format_abbrev_str to expand %z.
> +       (ZoneInfo::set_abbrev): Remove exception. Change parameter from
> +       reference to value.
> +       (operator>>(istream&, Rule&)): Do not clear letters when it
> +       contains "-".
> +       (time_zone::_M_get_sys_info): Add missing logic to find the Rule
> +       in effect before the time point.
> +       * testsuite/std/time/tzdb/1.cc: Adjust for vanguard format using
> +       "GMT" as the Zone name, not as a Link to "Etc/GMT".
> +       * testsuite/std/time/time_zone/sys_info_abbrev.cc: New test.
> +
> +(cherry picked from commit 0ca8d56f2085715f27ee536c6c344bc47af49cdd)
> +
> +Upstream-Status: Backport [
> https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D5ceea2ac106d6dd1aa8175=
670b15a801316cf1c9
> ]
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +---
> + libstdc++-v3/src/c++20/tzdb.cc                | 265 +++++++++++-------
> + .../std/time/time_zone/sys_info_abbrev.cc     | 106 +++++++
> + libstdc++-v3/testsuite/std/time/tzdb/1.cc     |   6 +-
> + 3 files changed, 274 insertions(+), 103 deletions(-)
> + create mode 100644
> libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
> +
> +diff --git a/libstdc++-v3/src/c++20/tzdb.cc
> b/libstdc++-v3/src/c++20/tzdb.cc
> +index c7c7cc9deee6..7e8cce7ce8cf 100644
> +--- a/libstdc++-v3/src/c++20/tzdb.cc
> ++++ b/libstdc++-v3/src/c++20/tzdb.cc
> +@@ -342,51 +342,103 @@ namespace std::chrono
> +       friend istream& operator>>(istream&, on_day&);
> +     };
> +
> +-    // Wrapper for chrono::year that reads a year, or one of the keywor=
ds
> +-    // "minimum" or "maximum", or an unambiguous prefix of a keyword.
> +-    struct minmax_year
> ++    // Wrapper for two chrono::year values, which reads the FROM and TO
> ++    // fields of a Rule line. The FROM field is a year and TO is a year
> or
> ++    // one of the keywords "maximum" or "only" (or an abbreviation of
> those).
> ++    // For backwards compatibility, the keyword "minimum" is recognized
> ++    // for FROM and interpreted as 1900.
> ++    struct years_from_to
> +     {
> +-      year& y;
> ++      year& from;
> ++      year& to;
> +
> +-      friend istream& operator>>(istream& in, minmax_year&& y)
> ++      friend istream& operator>>(istream& in, years_from_to&& yy)
> +       {
> +-      if (ws(in).peek() =3D=3D 'm') // keywords "minimum" or "maximum"
> ++      string s;
> ++      auto c =3D ws(in).peek();
> ++      if (c =3D=3D 'm') [[unlikely]] // keyword "minimum"
> +         {
> +-          string s;
> +-          in >> s; // extract the rest of the word, but only look at s[=
1]
> +-          if (s[1] =3D=3D 'a')
> +-            y.y =3D year::max();
> +-          else if (s[1] =3D=3D 'i')
> +-            y.y =3D year::min();
> +-          else
> +-            in.setstate(ios::failbit);
> ++          in >> s; // extract the rest of the word
> ++          yy.from =3D year(1900);
> ++        }
> ++      else if (int num =3D 0; in >> num) [[likely]]
> ++        yy.from =3D year{num};
> ++
> ++      c =3D ws(in).peek();
> ++      if (c =3D=3D 'm') // keyword "maximum"
> ++        {
> ++          in >> s; // extract the rest of the word
> ++          yy.to =3D year::max();
> ++        }
> ++      else if (c =3D=3D 'o') // keyword "only"
> ++        {
> ++          in >> s; // extract the rest of the word
> ++          yy.to =3D yy.from;
> +         }
> +       else if (int num =3D 0; in >> num)
> +-        y.y =3D year{num};
> ++        yy.to =3D year{num};
> ++
> +       return in;
> +       }
> +     };
> +
> +-    // As above for minmax_year, but also supports the keyword "only",
> +-    // meaning that the TO year is the same as the FROM year.
> +-    struct minmax_year2
> ++    bool
> ++    select_std_or_dst_abbrev(string& abbrev, minutes save)
> +     {
> +-      minmax_year to;
> +-      year from;
> ++      if (size_t pos =3D abbrev.find('/'); pos !=3D string::npos)
> ++      {
> ++        // Select one of "STD/DST" for standard or daylight.
> ++        if (save =3D=3D 0min)
> ++          abbrev.erase(pos);
> ++        else
> ++          abbrev.erase(0, pos + 1);
> ++        return true;
> ++      }
> ++      return false;
> ++    }
> +
> +-      friend istream& operator>>(istream& in, minmax_year2&& y)
> +-      {
> +-      if (ws(in).peek() =3D=3D 'o') // keyword "only"
> +-        {
> +-          string s;
> +-          in >> s; // extract the whole keyword
> +-          y.to.y =3D y.from;
> +-        }
> +-      else
> +-        in >> std::move(y.to);
> +-      return in;
> +-      }
> +-    };
> ++    // Set the sys_info::abbrev string by expanding any placeholders.
> ++    void
> ++    format_abbrev_str(sys_info& info, string_view letters =3D {})
> ++    {
> ++      if (size_t pos =3D info.abbrev.find('%'); pos !=3D string::npos)
> ++      {
> ++        if (info.abbrev[pos + 1] =3D=3D 's')
> ++          {
> ++            // Expand "%s" to the variable part, given by Rule::letters=
.
> ++            if (letters =3D=3D "-")
> ++              info.abbrev.erase(pos, 2);
> ++            else
> ++              info.abbrev.replace(pos, 2, letters);
> ++          }
> ++        else if (info.abbrev[pos + 1] =3D=3D 'z')
> ++          {
> ++            // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or
> +/-hhmmss.
> ++            hh_mm_ss<seconds> t(info.offset);
> ++            string z(1, "+-"[t.is_negative()]);
> ++            long val =3D t.hours().count();
> ++            int digits =3D 2;
> ++            if (int m =3D t.minutes().count())
> ++              {
> ++                digits =3D 4;
> ++                val *=3D 100;
> ++                val +=3D m;
> ++                if (int s =3D t.seconds().count())
> ++                  {
> ++                    digits =3D 6;
> ++                    val *=3D 100;
> ++                    val +=3D s;
> ++                  }
> ++              }
> ++            auto sval =3D std::to_string(val);
> ++            z +=3D string(digits - sval.size(), '0');
> ++            z +=3D sval;
> ++            info.abbrev.replace(pos, 2, z);
> ++          }
> ++      }
> ++      else
> ++      select_std_or_dst_abbrev(info.abbrev, info.save);
> ++    }
> +
> +     // A time zone information record.
> +     // Zone  NAME        STDOFF  RULES   FORMAT  [UNTIL]
> +@@ -462,6 +514,7 @@ namespace std::chrono
> +       info.offset =3D offset();
> +       info.save =3D minutes(m_save);
> +       info.abbrev =3D format();
> ++      format_abbrev_str(info); // expand %z
> +       return true;
> +       }
> +
> +@@ -469,12 +522,9 @@ namespace std::chrono
> +       friend class time_zone;
> +
> +       void
> +-      set_abbrev(const string& abbrev)
> ++      set_abbrev(string abbrev)
> +       {
> +-      // In practice, the FORMAT field never needs expanding here.
> +-      if (abbrev.find_first_of("/%") !=3D abbrev.npos)
> +-        __throw_runtime_error("std::chrono::time_zone: invalid data");
> +-      m_buf =3D abbrev;
> ++      m_buf =3D std::move(abbrev);
> +       m_pos =3D 0;
> +       m_expanded =3D true;
> +       }
> +@@ -544,9 +594,7 @@ namespace std::chrono
> +
> +       // Rule  NAME  FROM  TO  TYPE  IN  ON  AT  SAVE  LETTER/S
> +
> +-      in >> quoted(rule.name)
> +-         >> minmax_year{rule.from}
> +-         >> minmax_year2{rule.to, rule.from};
> ++      in >> quoted(rule.name) >> years_from_to{rule.from, rule.to};
> +
> +       if (char type; in >> type && type !=3D '-')
> +         in.setstate(ios::failbit);
> +@@ -557,7 +605,7 @@ namespace std::chrono
> +       if (save_time.indicator !=3D at_time::Wall)
> +         {
> +           // We don't actually store the save_time.indicator, because w=
e
> +-          // assume that it's always deducable from the actual offset
> value.
> ++          // assume that it's always deducible from the offset value.
> +           auto expected =3D save_time.time =3D=3D 0s
> +                             ? at_time::Standard
> +                             : at_time::Daylight;
> +@@ -567,8 +615,6 @@ namespace std::chrono
> +       rule.save =3D save_time.time;
> +
> +       in >> rule.letters;
> +-      if (rule.letters =3D=3D "-")
> +-        rule.letters.clear();
> +       return in;
> +       }
> +
> +@@ -719,58 +765,6 @@ namespace std::chrono
> + #endif // TZDB_DISABLED
> +   };
> +
> +-#ifndef TZDB_DISABLED
> +-  namespace
> +-  {
> +-    bool
> +-    select_std_or_dst_abbrev(string& abbrev, minutes save)
> +-    {
> +-      if (size_t pos =3D abbrev.find('/'); pos !=3D string::npos)
> +-      {
> +-        // Select one of "STD/DST" for standard or daylight.
> +-        if (save =3D=3D 0min)
> +-          abbrev.erase(pos);
> +-        else
> +-          abbrev.erase(0, pos + 1);
> +-        return true;
> +-      }
> +-      return false;
> +-    }
> +-
> +-    // Set the sys_info::abbrev string by expanding any placeholders.
> +-    void
> +-    format_abbrev_str(sys_info& info, string_view letters =3D {})
> +-    {
> +-      if (size_t pos =3D info.abbrev.find("%s"); pos !=3D string::npos)
> +-      {
> +-        // Expand "%s" to the variable part, given by Rule::letters.
> +-        info.abbrev.replace(pos, 2, letters);
> +-      }
> +-      else if (size_t pos =3D info.abbrev.find("%z"); pos !=3D string::=
npos)
> +-      {
> +-        // Expand "%z" to the UT offset as +/-hh, +/-hhmm, or +/-hhmmss=
.
> +-        hh_mm_ss<seconds> t(info.offset);
> +-        string z(1, "+-"[t.is_negative()]);
> +-        long val =3D t.hours().count();
> +-        if (minutes m =3D t.minutes(); m !=3D m.zero())
> +-          {
> +-            val *=3D 100;
> +-            val +=3D m.count();
> +-            if (seconds s =3D t.seconds(); s !=3D s.zero())
> +-              {
> +-                val *=3D 100;
> +-                val +=3D s.count();
> +-              }
> +-          }
> +-        z +=3D std::to_string(val);
> +-        info.abbrev.replace(pos, 2, z);
> +-      }
> +-      else
> +-      select_std_or_dst_abbrev(info.abbrev, info.save);
> +-    }
> +-  }
> +-#endif // TZDB_DISABLED
> +-
> +   // Implementation of std::chrono::time_zone::get_info(const
> sys_time<D>&)
> +   sys_info
> +   time_zone::_M_get_sys_info(sys_seconds tp) const
> +@@ -839,12 +833,72 @@ namespace std::chrono
> +     info.abbrev =3D ri.format();
> +
> +     string_view letters;
> +-    if (i !=3D infos.begin())
> ++    if (i !=3D infos.begin() && i[-1].expanded())
> ++      letters =3D i[-1].next_letters();
> ++
> ++    if (letters.empty())
> +       {
> +-      if (i[-1].expanded())
> +-        letters =3D i[-1].next_letters();
> +-      // XXX else need to find Rule active before this time and use it
> +-      // to know the initial offset, save, and letters.
> ++      sys_seconds t =3D info.begin - seconds(1);
> ++      const year_month_day date(chrono::floor<days>(t));
> ++
> ++      // Try to find a Rule active before this time, to get initial
> ++      // SAVE and LETTERS values. There may not be a Rule for the perio=
d
> ++      // before the first DST transition, so find the earliest DST->STD
> ++      // transition and use the LETTERS from that.
> ++      const Rule* active_rule =3D nullptr;
> ++      sys_seconds active_rule_start =3D sys_seconds::min();
> ++      const Rule* first_std =3D nullptr;
> ++      for (const auto& rule : rules)
> ++        {
> ++          if (rule.save =3D=3D minutes(0))
> ++            {
> ++              if (!first_std)
> ++                first_std =3D &rule;
> ++              else if (rule.from < first_std->from)
> ++                first_std =3D &rule;
> ++              else if (rule.from =3D=3D first_std->from)
> ++                {
> ++                  if (rule.start_time(rule.from, {})
> ++                        < first_std->start_time(first_std->from, {}))
> ++                    first_std =3D &rule;
> ++                }
> ++            }
> ++
> ++          year y =3D date.year();
> ++
> ++          if (y > rule.to) // rule no longer applies at time t
> ++            continue;
> ++          if (y < rule.from) // rule doesn't apply yet at time t
> ++            continue;
> ++
> ++          sys_seconds rule_start;
> ++
> ++          seconds offset{}; // appropriate for at_time::Universal
> ++          if (rule.when.indicator =3D=3D at_time::Wall)
> ++            offset =3D info.offset;
> ++          else if (rule.when.indicator =3D=3D at_time::Standard)
> ++            offset =3D ri.offset();
> ++
> ++          // Time the rule takes effect this year:
> ++          rule_start =3D rule.start_time(y, offset);
> ++
> ++          if (rule_start >=3D t && rule.from < y)
> ++            {
> ++              // Try this rule in the previous year.
> ++              rule_start =3D rule.start_time(--y, offset);
> ++            }
> ++
> ++          if (active_rule_start < rule_start && rule_start < t)
> ++            {
> ++              active_rule_start =3D rule_start;
> ++              active_rule =3D &rule;
> ++            }
> ++        }
> ++
> ++      if (active_rule)
> ++        letters =3D active_rule->letters;
> ++      else if (first_std)
> ++        letters =3D first_std->letters;
> +       }
> +
> +     const Rule* curr_rule =3D nullptr;
> +@@ -2069,9 +2123,11 @@ namespace std::chrono
> +             istringstream in2(std::move(rules));
> +             in2 >> rules_time;
> +             inf.m_save =3D duration_cast<minutes>(rules_time.time);
> ++            // If the FORMAT is "STD/DST" then we can choose the right
> one
> ++            // now, so that we store a shorter string.
> +             select_std_or_dst_abbrev(fmt, inf.m_save);
> +           }
> +-        inf.set_abbrev(fmt);
> ++        inf.set_abbrev(std::move(fmt));
> +       }
> +
> +       // YEAR [MONTH [DAY [TIME]]]
> +@@ -2082,7 +2138,12 @@ namespace std::chrono
> +         abbrev_month m{January};
> +         int d =3D 1;
> +         at_time t{};
> ++        // XXX DAY should support ON format, e.g. lastSun or Sun>=3D8
> +         in >> m >> d >> t;
> ++        // XXX UNTIL field should be interpreted
> ++        // "using the rules in effect just before the transition"
> ++        // so might need to store as year_month_day and hh_mm_ss and on=
ly
> ++        // convert to a sys_time once we know the offset in effect.
> +         inf.m_until =3D sys_days(year(y)/m.m/day(d)) + seconds(t.time);
> +       }
> +       else
> +diff --git a/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.c=
c
> b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
> +new file mode 100644
> +index 000000000000..f1a8fff02f58
> +--- /dev/null
> ++++ b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc
> +@@ -0,0 +1,106 @@
> ++// { dg-do run { target c++20 } }
> ++// { dg-require-effective-target tzdb }
> ++// { dg-require-effective-target cxx11_abi }
> ++// { dg-xfail-run-if "no weak override on AIX" { powerpc-ibm-aix* } }
> ++
> ++#include <chrono>
> ++#include <fstream>
> ++#include <testsuite_hooks.h>
> ++
> ++static bool override_used =3D false;
> ++
> ++namespace __gnu_cxx
> ++{
> ++  const char* zoneinfo_dir_override() {
> ++    override_used =3D true;
> ++    return "./";
> ++  }
> ++}
> ++
> ++using namespace std::chrono;
> ++
> ++void
> ++test_format()
> ++{
> ++  std::ofstream("tzdata.zi") << R"(# version test_1
> ++Zone Africa/Bissau -1:2:20 - LMT 1912 Ja 1 1u
> ++                   -1      - %z  1975
> ++                   0       - GMT
> ++Zon Some/Zone 1:2:3   - %z 1900
> ++              1:23:45 - %z 1950
> ++Zo Another/Zone 1:2:3 -     AZ0     1901
> ++                1     Roolz A%sZ    2000
> ++                1     Roolz SAZ/DAZ 2005
> ++                1     Roolz %z
> ++Rule Roolz 1950 max - April 1 2 1 D
> ++Rul  Roolz 1950 max - Oct   1 1 0 S
> ++Z Strange/Zone 1       - X%sX    1980
> ++               1       - FOO/BAR 1990
> ++               2:00    - %zzz    1995
> ++               0:9     - %zzz    1996
> ++               0:8:7   - %zzz    1997
> ++               0:6:5.5 - %zzz    1998
> ++)";
> ++
> ++  const auto& db =3D reload_tzdb();
> ++  VERIFY( override_used ); // If this fails then XFAIL for the target.
> ++  VERIFY( db.version =3D=3D "test_1" );
> ++
> ++  // Test formatting %z as
> ++  auto tz =3D locate_zone("Africa/Bissau");
> ++  auto inf =3D tz->get_info(sys_days(1974y/1/1));
> ++  VERIFY( inf.abbrev =3D=3D "-01" );
> ++
> ++  tz =3D locate_zone("Some/Zone");
> ++  inf =3D tz->get_info(sys_days(1899y/1/1));
> ++  VERIFY( inf.abbrev =3D=3D "+010203" );
> ++  inf =3D tz->get_info(sys_days(1955y/1/1));
> ++  VERIFY( inf.abbrev =3D=3D "+012345" );
> ++
> ++  tz =3D locate_zone("Another/Zone");
> ++  // Test formatting %s as the LETTER/S field from the active Rule.
> ++  inf =3D tz->get_info(sys_days(1910y/January/1));
> ++  VERIFY( inf.abbrev =3D=3D "ASZ" );
> ++  inf =3D tz->get_info(sys_days(1950y/January/1));
> ++  VERIFY( inf.abbrev =3D=3D "ASZ" );
> ++  inf =3D tz->get_info(sys_days(1950y/June/1));
> ++  VERIFY( inf.abbrev =3D=3D "ADZ" );
> ++  inf =3D tz->get_info(sys_days(1999y/January/1));
> ++  VERIFY( inf.abbrev =3D=3D "ASZ" );
> ++  inf =3D tz->get_info(sys_days(1999y/July/1));
> ++  VERIFY( inf.abbrev =3D=3D "ADZ" );
> ++  // Test formatting STD/DST according to the active Rule.
> ++  inf =3D tz->get_info(sys_days(2000y/January/2));
> ++  VERIFY( inf.abbrev =3D=3D "SAZ" );
> ++  inf =3D tz->get_info(sys_days(2001y/January/1));
> ++  VERIFY( inf.abbrev =3D=3D "SAZ" );
> ++  inf =3D tz->get_info(sys_days(2001y/July/1));
> ++  VERIFY( inf.abbrev =3D=3D "DAZ" );
> ++  // Test formatting %z as the offset determined by the active Rule.
> ++  inf =3D tz->get_info(sys_days(2005y/January/2));
> ++  VERIFY( inf.abbrev =3D=3D "+01" );
> ++  inf =3D tz->get_info(sys_days(2006y/January/1));
> ++  VERIFY( inf.abbrev =3D=3D "+01" );
> ++  inf =3D tz->get_info(sys_days(2006y/July/1));
> ++  VERIFY( inf.abbrev =3D=3D "+02" );
> ++
> ++  // Test formatting %z, %s and S/D for a Zone with no associated Rules=
.
> ++  tz =3D locate_zone("Strange/Zone");
> ++  inf =3D tz->get_info(sys_days(1979y/January/1));
> ++  VERIFY( inf.abbrev =3D=3D "XX" ); // No Rule means nothing to use for=
 %s.
> ++  inf =3D tz->get_info(sys_days(1981y/July/1));
> ++  VERIFY( inf.abbrev =3D=3D "FOO" ); // Always standard time means firs=
t
> string.
> ++  inf =3D tz->get_info(sys_days(1994y/July/1));
> ++  VERIFY( inf.abbrev =3D=3D "+02zz" );
> ++  inf =3D tz->get_info(sys_days(1995y/July/1));
> ++  VERIFY( inf.abbrev =3D=3D "+0009zz" );
> ++  inf =3D tz->get_info(sys_days(1996y/July/1));
> ++  VERIFY( inf.abbrev =3D=3D "+000807zz" );
> ++  inf =3D tz->get_info(sys_days(1997y/July/1));
> ++  VERIFY( inf.abbrev =3D=3D "+000606zz" );
> ++}
> ++
> ++int main()
> ++{
> ++  test_format();
> ++}
> +diff --git a/libstdc++-v3/testsuite/std/time/tzdb/1.cc
> b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
> +index 796f3a8b4256..7a31c1c20ba7 100644
> +--- a/libstdc++-v3/testsuite/std/time/tzdb/1.cc
> ++++ b/libstdc++-v3/testsuite/std/time/tzdb/1.cc
> +@@ -39,11 +39,15 @@ test_locate()
> +   const tzdb& db =3D get_tzdb();
> +   const time_zone* tz =3D db.locate_zone("GMT");
> +   VERIFY( tz !=3D nullptr );
> +-  VERIFY( tz->name() =3D=3D "Etc/GMT" );
> +   VERIFY( tz =3D=3D std::chrono::locate_zone("GMT") );
> +   VERIFY( tz =3D=3D db.locate_zone("Etc/GMT") );
> +   VERIFY( tz =3D=3D db.locate_zone("Etc/GMT+0") );
> +
> ++  // Since 2022f GMT is now a Zone and Etc/GMT a link instead of vice
> versa,
> ++  // but only when using the vanguard format. As of 2024a, the main and
> ++  // rearguard formats still have Etc/GMT as a Zone and GMT as a link.
> ++  VERIFY( tz->name() =3D=3D "GMT" || tz->name() =3D=3D "Etc/GMT" );
> ++
> +   VERIFY( db.locate_zone(db.current_zone()->name()) =3D=3D db.current_z=
one()
> );
> + }
> +
> +--
> +2.43.5
> +
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207584):
> https://lists.openembedded.org/g/openembedded-core/message/207584
> Mute This Topic: https://lists.openembedded.org/mt/109715703/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007e80c8062777a32f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Patch is fine however I would suggest to remove the hunk =
changing changellog files it will make it easy to backport=C2=A0</div><div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Nov 21, 2024 at 5:30=E2=80=AFPM Markus Volk via <a href=3D"http://lists.o=
penembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t=
-online.de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;=
border-left-color:rgb(204,204,204)">There is an issue in the std::chrono::t=
zdb parser that causes problems<br>
since the tzdata-2024b release started using %z in the main format.<br>
<br>
As a real world problem I encounter an issue with the waybar clock module,<=
br>
which ignores the timezone setting and only shows system time.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-14.2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 +<br>
=C2=A0...4fffe3fc82a710bea66ad651720d71c938b8.patch | 567 +++++++++++++++++=
+<br>
=C2=A02 files changed, 568 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc=
82a710bea66ad651720d71c938b8.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools=
/gcc/gcc-14.2.inc<br>
index f05484cfc0..9cfb246294 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc<br>
@@ -68,6 +68,7 @@ SRC_URI =3D &quot;${BASEURI} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-Fix-install-path-of-l=
inux64.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-Avoid-hardcoded-build=
-paths-into-ppc-libgcc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0025-gcc-testsuite-tweaks-=
for-mips-OE.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc.git-ab884fffe3fc82a710=
bea66ad651720d71c938b8.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0S =3D &quot;${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}&quot;<=
br>
diff --git a/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66a=
d651720d71c938b8.patch b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc=
82a710bea66ad651720d71c938b8.patch<br>
new file mode 100644<br>
index 0000000000..ca6fc92e07<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/gcc/gcc/gcc.git-ab884fffe3fc82a710bea66ad651720=
d71c938b8.patch<br>
@@ -0,0 +1,567 @@<br>
+From ab884fffe3fc82a710bea66ad651720d71c938b8 Mon Sep 17 00:00:00 2001<br>
+From: Jonathan Wakely &lt;<a href=3D"mailto:jwakely@redhat.com" target=3D"=
_blank">jwakely@redhat.com</a>&gt;<br>
+Date: Tue, 30 Apr 2024 09:52:13 +0100<br>
+Subject: [PATCH] libstdc++: Fix std::chrono::tzdb to work with vanguard fo=
rmat<br>
+<br>
+I found some issues in the std::chrono::tzdb parser by testing the<br>
+tzdata &quot;vanguard&quot; format, which uses new features that aren&#39;=
t enabled in<br>
+the &quot;main&quot; and &quot;rearguard&quot; data formats.<br>
+<br>
+Since 2024a the keyword &quot;minimum&quot; is no longer valid for the FRO=
M and TO<br>
+fields in a Rule line, which means that &quot;m&quot; is now a valid abbre=
viation<br>
+for &quot;maximum&quot;. Previously we expected either &quot;mi&quot; or &=
quot;ma&quot;. For backwards<br>
+compatibility, a FROM field beginning with &quot;mi&quot; is still support=
ed and<br>
+is treated as 1900. The &quot;maximum&quot; keyword is only allowed in TO =
now,<br>
+because it makes no sense in FROM. To support these changes the<br>
+minmax_year and minmax_year2 classes for parsing FROM and TO are<br>
+replaced with a single years_from_to class that reads both fields.<br>
+<br>
+The vanguard format makes use of %z in Zone FORMAT fields, which caused<br=
>
+an exception to be thrown from ZoneInfo::set_abbrev because no % or /<br>
+characters were expected when a Zone doesn&#39;t use a named Rule. The<br>
+ZoneInfo::to(sys_info&amp;) function now uses format_abbrev_str to replace=
<br>
+any %z with the current offset. Although format_abbrev_str also checks<br>
+for %s and STD/DST formats, those only make sense when a named Rule is<br>
+in effect, so won&#39;t occur when ZoneInfo::to(sys_info&amp;) is used.<br=
>
+<br>
+Since making this change on trunk, the tzdata-2024b release started<br>
+using %z in the main format, not just vanguard. This makes a backport to<b=
r>
+release branches necessary (see PR 116657).<br>
+<br>
+This change also implements a feature that has always been missing from<br=
>
+time_zone::_M_get_sys_info: finding the Rule that is active before the<br>
+specified time point, so that we can correctly handle %s in the FORMAT<br>
+for the first new sys_info that gets created. This requires implementing<b=
r>
+a poorly documented feature of zic, to get the LETTERS field from a<br>
+later transition, as described at<br>
+<a href=3D"https://mm.icann.org/pipermail/tz/2024-April/058891.html" rel=
=3D"noreferrer" target=3D"_blank">https://mm.icann.org/pipermail/tz/2024-Ap=
ril/058891.html</a><br>
+In order for this to work we need to be able to distinguish an empty<br>
+letters field (as used by CE%sT where the variable part is either empty<br=
>
+or &quot;S&quot;) from &quot;the letters field is not known for this trans=
ition&quot;. The<br>
+tzdata file uses &quot;-&quot; for an empty letters field, which libstdc++=
 was<br>
+previously replacing with &quot;&quot; when the Rule was parsed. Instead, =
we now<br>
+preserve the &quot;-&quot; in the Rule object, so that &quot;&quot; can be=
 used for the case<br>
+where we don&#39;t know the letters (and so need to decide it).<br>
+<br>
+libstdc++-v3/ChangeLog:<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* src/c++20/tzdb.cc (minmax_year, minmax_year2)=
: Remove.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(years_from_to): New class replacing minmax_yea=
r and<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0minmax_year2.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(format_abbrev_str, select_std_or_dst_abbrev): =
Move earlier in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0the file. Handle &quot;-&quot; for letters.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ZoneInfo::to): Use format_abbrev_str to expand=
 %z.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(ZoneInfo::set_abbrev): Remove exception. Chang=
e parameter from<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reference to value.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(operator&gt;&gt;(istream&amp;, Rule&amp;)): Do=
 not clear letters when it<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0contains &quot;-&quot;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(time_zone::_M_get_sys_info): Add missing logic=
 to find the Rule<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0in effect before the time point.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* testsuite/std/time/tzdb/1.cc: Adjust for vang=
uard format using<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;GMT&quot; as the Zone name, not as a Link=
 to &quot;Etc/GMT&quot;.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* testsuite/std/time/time_zone/sys_info_abbrev.=
cc: New test.<br>
+<br>
+(cherry picked from commit 0ca8d56f2085715f27ee536c6c344bc47af49cdd)<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/gitweb.cgi?p=
=3Dgcc.git;h=3D5ceea2ac106d6dd1aa8175670b15a801316cf1c9" rel=3D"noreferrer"=
 target=3D"_blank">https://gcc.gnu.org/git/gitweb.cgi?p=3Dgcc.git;h=3D5ceea=
2ac106d6dd1aa8175670b15a801316cf1c9</a>]<br>
+<br>
+Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
+---<br>
+ libstdc++-v3/src/c++20/tzdb.cc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 265 +++++++++++-------<br>
+ .../std/time/time_zone/sys_info_abbrev.cc=C2=A0 =C2=A0 =C2=A0| 106 ++++++=
+<br>
+ libstdc++-v3/testsuite/std/time/tzdb/1.cc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +-<br>
+ 3 files changed, 274 insertions(+), 103 deletions(-)<br>
+ create mode 100644 libstdc++-v3/testsuite/std/time/time_zone/sys_info_abb=
rev.cc<br>
+<br>
+diff --git a/libstdc++-v3/src/c++20/tzdb.cc b/libstdc++-v3/src/c++20/tzdb.=
cc<br>
+index c7c7cc9deee6..7e8cce7ce8cf 100644<br>
+--- a/libstdc++-v3/src/c++20/tzdb.cc<br>
++++ b/libstdc++-v3/src/c++20/tzdb.cc<br>
+@@ -342,51 +342,103 @@ namespace std::chrono<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0friend istream&amp; operator&gt;&gt;(istream&am=
p;, on_day&amp;);<br>
+=C2=A0 =C2=A0 =C2=A0};<br>
+ <br>
+-=C2=A0 =C2=A0 // Wrapper for chrono::year that reads a year, or one of th=
e keywords<br>
+-=C2=A0 =C2=A0 // &quot;minimum&quot; or &quot;maximum&quot;, or an unambi=
guous prefix of a keyword.<br>
+-=C2=A0 =C2=A0 struct minmax_year<br>
++=C2=A0 =C2=A0 // Wrapper for two chrono::year values, which reads the FRO=
M and TO<br>
++=C2=A0 =C2=A0 // fields of a Rule line. The FROM field is a year and TO i=
s a year or<br>
++=C2=A0 =C2=A0 // one of the keywords &quot;maximum&quot; or &quot;only&qu=
ot; (or an abbreviation of those).<br>
++=C2=A0 =C2=A0 // For backwards compatibility, the keyword &quot;minimum&q=
uot; is recognized<br>
++=C2=A0 =C2=A0 // for FROM and interpreted as 1900.<br>
++=C2=A0 =C2=A0 struct years_from_to<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 year&amp; y;<br>
++=C2=A0 =C2=A0 =C2=A0 year&amp; from;<br>
++=C2=A0 =C2=A0 =C2=A0 year&amp; to;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 friend istream&amp; operator&gt;&gt;(istream&amp; in=
, minmax_year&amp;&amp; y)<br>
++=C2=A0 =C2=A0 =C2=A0 friend istream&amp; operator&gt;&gt;(istream&amp; in=
, years_from_to&amp;&amp; yy)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 if (ws(in).peek() =3D=3D &#39;m&#39;) // keywords &q=
uot;minimum&quot; or &quot;maximum&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 string s;<br>
++=C2=A0 =C2=A0 =C2=A0 auto c =3D ws(in).peek();<br>
++=C2=A0 =C2=A0 =C2=A0 if (c =3D=3D &#39;m&#39;) [[unlikely]] // keyword &q=
uot;minimum&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string s;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in &gt;&gt; s; // extract the rest of =
the word, but only look at s[1]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s[1] =3D=3D &#39;a&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y.y =3D year::max();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (s[1] =3D=3D &#39;i&#39;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y.y =3D year::min();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in.setstate(ios::failbit);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in &gt;&gt; s; // extract the rest of =
the word<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yy.from =3D year(1900);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else if (int num =3D 0; in &gt;&gt; num) [[likely]]<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 yy.from =3D year{num};<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 c =3D ws(in).peek();<br>
++=C2=A0 =C2=A0 =C2=A0 if (c =3D=3D &#39;m&#39;) // keyword &quot;maximum&q=
uot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in &gt;&gt; s; // extract the rest of =
the word<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://yy.to" rel=3D"norefe=
rrer" target=3D"_blank">yy.to</a> =3D year::max();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else if (c =3D=3D &#39;o&#39;) // keyword &quot;only=
&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in &gt;&gt; s; // extract the rest of =
the word<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://yy.to" rel=3D"norefe=
rrer" target=3D"_blank">yy.to</a> =3D yy.from;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (int num =3D 0; in &gt;&gt; num)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 y.y =3D year{num};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://yy.to" rel=3D"noreferrer" t=
arget=3D"_blank">yy.to</a> =3D year{num};<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return in;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0};<br>
+ <br>
+-=C2=A0 =C2=A0 // As above for minmax_year, but also supports the keyword =
&quot;only&quot;,<br>
+-=C2=A0 =C2=A0 // meaning that the TO year is the same as the FROM year.<b=
r>
+-=C2=A0 =C2=A0 struct minmax_year2<br>
++=C2=A0 =C2=A0 bool<br>
++=C2=A0 =C2=A0 select_std_or_dst_abbrev(string&amp; abbrev, minutes save)<=
br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 minmax_year to;<br>
+-=C2=A0 =C2=A0 =C2=A0 year from;<br>
++=C2=A0 =C2=A0 =C2=A0 if (size_t pos =3D abbrev.find(&#39;/&#39;); pos !=
=3D string::npos)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Select one of &quot;STD/DST&quot; for stan=
dard or daylight.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (save =3D=3D 0min)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abbrev.erase(pos);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abbrev.erase(0, pos + 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 friend istream&amp; operator&gt;&gt;(istream&amp; in=
, minmax_year2&amp;&amp; y)<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (ws(in).peek() =3D=3D &#39;o&#39;) // keyword &qu=
ot;only&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string s;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 in &gt;&gt; s; // extract the whole ke=
yword<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 y.to.y =3D y.from;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 in &gt;&gt; std::move(<a href=3D"http://y.to"=
 rel=3D"noreferrer" target=3D"_blank">y.to</a>);<br>
+-=C2=A0 =C2=A0 =C2=A0 return in;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 };<br>
++=C2=A0 =C2=A0 // Set the sys_info::abbrev string by expanding any placeho=
lders.<br>
++=C2=A0 =C2=A0 void<br>
++=C2=A0 =C2=A0 format_abbrev_str(sys_info&amp; info, string_view letters =
=3D {})<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 if (size_t pos =3D info.abbrev.find(&#39;%&#39;); po=
s !=3D string::npos)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info.abbrev[pos + 1] =3D=3D &#39;s&#39;)<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Expand &quot;%s&quot; to the=
 variable part, given by Rule::letters.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (letters =3D=3D &quot;-&quot=
;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.abbrev.erase(pos, 2=
);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.abbrev.replace(pos,=
 2, letters);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (info.abbrev[pos + 1] =3D=3D &#39;z&#=
39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Expand &quot;%z&quot; to the=
 UT offset as +/-hh, +/-hhmm, or +/-hhmmss.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hh_mm_ss&lt;seconds&gt; t(info.=
offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string z(1, &quot;+-&quot;[t.is=
_negative()]);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long val =3D t.hours().count();=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int digits =3D 2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int m =3D t.minutes().count=
())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 digits =3D 4;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val *=3D 100;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val +=3D m;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (int s =3D t.s=
econds().count())<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dig=
its =3D 6;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val=
 *=3D 100;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val=
 +=3D s;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 auto sval =3D std::to_string(va=
l);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 z +=3D string(digits - sval.siz=
e(), &#39;0&#39;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 z +=3D sval;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.abbrev.replace(pos, 2, z);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 select_std_or_dst_abbrev(info.abbrev, info.save);<br=
>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0// A time zone information record.<br>
+=C2=A0 =C2=A0 =C2=A0// Zone=C2=A0 NAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 STDOFF=
=C2=A0 RULES=C2=A0 =C2=A0FORMAT=C2=A0 [UNTIL]<br>
+@@ -462,6 +514,7 @@ namespace std::chrono<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info.offset =3D offset();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info.save =3D minutes(m_save);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info.abbrev =3D format();<br>
++=C2=A0 =C2=A0 =C2=A0 format_abbrev_str(info); // expand %z<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -469,12 +522,9 @@ namespace std::chrono<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0friend class time_zone;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void<br>
+-=C2=A0 =C2=A0 =C2=A0 set_abbrev(const string&amp; abbrev)<br>
++=C2=A0 =C2=A0 =C2=A0 set_abbrev(string abbrev)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 // In practice, the FORMAT field never needs expandi=
ng here.<br>
+-=C2=A0 =C2=A0 =C2=A0 if (abbrev.find_first_of(&quot;/%&quot;) !=3D abbrev=
.npos)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 __throw_runtime_error(&quot;std::chrono::time=
_zone: invalid data&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 m_buf =3D abbrev;<br>
++=C2=A0 =C2=A0 =C2=A0 m_buf =3D std::move(abbrev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0m_pos =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0m_expanded =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -544,9 +594,7 @@ namespace std::chrono<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Rule=C2=A0 NAME=C2=A0 FROM=C2=A0 TO=C2=A0 TY=
PE=C2=A0 IN=C2=A0 ON=C2=A0 AT=C2=A0 SAVE=C2=A0 LETTER/S<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 in &gt;&gt; quoted(<a href=3D"http://rule.name" rel=
=3D"noreferrer" target=3D"_blank">rule.name</a>)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; minmax_year{rule.from}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; minmax_year2{<a href=3D"http:/=
/rule.to" rel=3D"noreferrer" target=3D"_blank">rule.to</a>, rule.from};<br>
++=C2=A0 =C2=A0 =C2=A0 in &gt;&gt; quoted(<a href=3D"http://rule.name" rel=
=3D"noreferrer" target=3D"_blank">rule.name</a>) &gt;&gt; years_from_to{rul=
e.from, <a href=3D"http://rule.to" rel=3D"noreferrer" target=3D"_blank">rul=
e.to</a>};<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (char type; in &gt;&gt; type &amp;&amp; type=
 !=3D &#39;-&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in.setstate(ios::failbit);<br>
+@@ -557,7 +605,7 @@ namespace std::chrono<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (save_time.indicator !=3D at_time::Wall)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// We don&#39;t actually store th=
e save_time.indicator, because we<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // assume that it&#39;s always deducab=
le from the actual offset value.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // assume that it&#39;s always deducib=
le from the offset value.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0auto expected =3D save_time.time =
=3D=3D 0s<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0? at_time::Standard<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: at_time::Daylight;<br>
+@@ -567,8 +615,6 @@ namespace std::chrono<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rule.save =3D save_time.time;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0in &gt;&gt; rule.letters;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (rule.letters =3D=3D &quot;-&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rule.letters.clear();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return in;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+@@ -719,58 +765,6 @@ namespace std::chrono<br>
+ #endif // TZDB_DISABLED<br>
+=C2=A0 =C2=A0};<br>
+ <br>
+-#ifndef TZDB_DISABLED<br>
+-=C2=A0 namespace<br>
+-=C2=A0 {<br>
+-=C2=A0 =C2=A0 bool<br>
+-=C2=A0 =C2=A0 select_std_or_dst_abbrev(string&amp; abbrev, minutes save)<=
br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (size_t pos =3D abbrev.find(&#39;/&#39;); pos !=
=3D string::npos)<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Select one of &quot;STD/DST&quot; for stan=
dard or daylight.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (save =3D=3D 0min)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abbrev.erase(pos);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abbrev.erase(0, pos + 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 return false;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 // Set the sys_info::abbrev string by expanding any placeho=
lders.<br>
+-=C2=A0 =C2=A0 void<br>
+-=C2=A0 =C2=A0 format_abbrev_str(sys_info&amp; info, string_view letters =
=3D {})<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 if (size_t pos =3D info.abbrev.find(&quot;%s&quot;);=
 pos !=3D string::npos)<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Expand &quot;%s&quot; to the variable part=
, given by Rule::letters.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 info.abbrev.replace(pos, 2, letters);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 else if (size_t pos =3D info.abbrev.find(&quot;%z&qu=
ot;); pos !=3D string::npos)<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Expand &quot;%z&quot; to the UT offset as =
+/-hh, +/-hhmm, or +/-hhmmss.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 hh_mm_ss&lt;seconds&gt; t(info.offset);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 string z(1, &quot;+-&quot;[t.is_negative()]);=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 long val =3D t.hours().count();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (minutes m =3D t.minutes(); m !=3D m.zero(=
))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val *=3D 100;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val +=3D m.count();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seconds s =3D t.seconds(); =
s !=3D s.zero())<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val *=3D 100;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val +=3D s.count(=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 z +=3D std::to_string(val);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 info.abbrev.replace(pos, 2, z);<br>
+-=C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 else<br>
+-=C2=A0 =C2=A0 =C2=A0 select_std_or_dst_abbrev(info.abbrev, info.save);<br=
>
+-=C2=A0 =C2=A0 }<br>
+-=C2=A0 }<br>
+-#endif // TZDB_DISABLED<br>
+-<br>
+=C2=A0 =C2=A0// Implementation of std::chrono::time_zone::get_info(const s=
ys_time&lt;D&gt;&amp;)<br>
+=C2=A0 =C2=A0sys_info<br>
+=C2=A0 =C2=A0time_zone::_M_get_sys_info(sys_seconds tp) const<br>
+@@ -839,12 +833,72 @@ namespace std::chrono<br>
+=C2=A0 =C2=A0 =C2=A0info.abbrev =3D ri.format();<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0string_view letters;<br>
+-=C2=A0 =C2=A0 if (i !=3D infos.begin())<br>
++=C2=A0 =C2=A0 if (i !=3D infos.begin() &amp;&amp; i[-1].expanded())<br>
++=C2=A0 =C2=A0 =C2=A0 letters =3D i[-1].next_letters();<br>
++<br>
++=C2=A0 =C2=A0 if (letters.empty())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 if (i[-1].expanded())<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 letters =3D i[-1].next_letters();<br>
+-=C2=A0 =C2=A0 =C2=A0 // XXX else need to find Rule active before this tim=
e and use it<br>
+-=C2=A0 =C2=A0 =C2=A0 // to know the initial offset, save, and letters.<br=
>
++=C2=A0 =C2=A0 =C2=A0 sys_seconds t =3D info.begin - seconds(1);<br>
++=C2=A0 =C2=A0 =C2=A0 const year_month_day date(chrono::floor&lt;days&gt;(=
t));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 // Try to find a Rule active before this time, to ge=
t initial<br>
++=C2=A0 =C2=A0 =C2=A0 // SAVE and LETTERS values. There may not be a Rule =
for the period<br>
++=C2=A0 =C2=A0 =C2=A0 // before the first DST transition, so find the earl=
iest DST-&gt;STD<br>
++=C2=A0 =C2=A0 =C2=A0 // transition and use the LETTERS from that.<br>
++=C2=A0 =C2=A0 =C2=A0 const Rule* active_rule =3D nullptr;<br>
++=C2=A0 =C2=A0 =C2=A0 sys_seconds active_rule_start =3D sys_seconds::min()=
;<br>
++=C2=A0 =C2=A0 =C2=A0 const Rule* first_std =3D nullptr;<br>
++=C2=A0 =C2=A0 =C2=A0 for (const auto&amp; rule : rules)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rule.save =3D=3D minutes(0))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!first_std)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 first_std =3D &am=
p;rule;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (rule.from &lt; =
first_std-&gt;from)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 first_std =3D &am=
p;rule;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (rule.from =3D=
=3D first_std-&gt;from)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rule.s=
tart_time(rule.from, {})<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt; first_std-&gt;start_time(first_std-&gt;from, {}))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fir=
st_std =3D &amp;rule;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 year y =3D date.year();<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (y &gt; <a href=3D"http://rule.to" =
rel=3D"noreferrer" target=3D"_blank">rule.to</a>) // rule no longer applies=
 at time t<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (y &lt; rule.from) // rule doesn&#3=
9;t apply yet at time t<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sys_seconds rule_start;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seconds offset{}; // appropriate for a=
t_time::Universal<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rule.when.indicator =3D=3D at_time=
::Wall)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D info.offset;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (rule.when.indicator =3D=3D at=
_time::Standard)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D ri.offset();<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Time the rule takes effect this yea=
r:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rule_start =3D rule.start_time(y, offs=
et);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rule_start &gt;=3D t &amp;&amp; ru=
le.from &lt; y)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Try this rule in the =
previous year.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rule_start =3D rule.star=
t_time(--y, offset);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (active_rule_start &lt; rule_start =
&amp;&amp; rule_start &lt; t)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 active_rule_start =3D ru=
le_start;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 active_rule =3D &amp;rul=
e;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 if (active_rule)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 letters =3D active_rule-&gt;letters;<br>
++=C2=A0 =C2=A0 =C2=A0 else if (first_std)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 letters =3D first_std-&gt;letters;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0const Rule* curr_rule =3D nullptr;<br>
+@@ -2069,9 +2123,11 @@ namespace std::chrono<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0istringstream in2(std::mov=
e(rules));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in2 &gt;&gt; rules_time;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inf.m_save =3D duration_ca=
st&lt;minutes&gt;(rules_time.time);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // If the FORMAT is &quot;STD/D=
ST&quot; then we can choose the right one<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // now, so that we store a shor=
ter string.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0select_std_or_dst_abbrev(f=
mt, inf.m_save);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 inf.set_abbrev(fmt);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 inf.set_abbrev(std::move(fmt));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// YEAR [MONTH [DAY [TIME]]]<br>
+@@ -2082,7 +2138,12 @@ namespace std::chrono<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0abbrev_month m{January};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int d =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0at_time t{};<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // XXX DAY should support ON format, e.g. las=
tSun or Sun&gt;=3D8<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in &gt;&gt; m &gt;&gt; d &gt;&gt; t;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // XXX UNTIL field should be interpreted<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // &quot;using the rules in effect just befor=
e the transition&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // so might need to store as year_month_day a=
nd hh_mm_ss and only<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // convert to a sys_time once we know the off=
set in effect.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0inf.m_until =3D sys_days(year(y)/m.m/day=
(d)) + seconds(t.time);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+diff --git a/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc =
b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc<br>
+new file mode 100644<br>
+index 000000000000..f1a8fff02f58<br>
+--- /dev/null<br>
++++ b/libstdc++-v3/testsuite/std/time/time_zone/sys_info_abbrev.cc<br>
+@@ -0,0 +1,106 @@<br>
++// { dg-do run { target c++20 } }<br>
++// { dg-require-effective-target tzdb }<br>
++// { dg-require-effective-target cxx11_abi }<br>
++// { dg-xfail-run-if &quot;no weak override on AIX&quot; { powerpc-ibm-ai=
x* } }<br>
++<br>
++#include &lt;chrono&gt;<br>
++#include &lt;fstream&gt;<br>
++#include &lt;testsuite_hooks.h&gt;<br>
++<br>
++static bool override_used =3D false;<br>
++<br>
++namespace __gnu_cxx<br>
++{<br>
++=C2=A0 const char* zoneinfo_dir_override() {<br>
++=C2=A0 =C2=A0 override_used =3D true;<br>
++=C2=A0 =C2=A0 return &quot;./&quot;;<br>
++=C2=A0 }<br>
++}<br>
++<br>
++using namespace std::chrono;<br>
++<br>
++void<br>
++test_format()<br>
++{<br>
++=C2=A0 std::ofstream(&quot;tzdata.zi&quot;) &lt;&lt; R&quot;(# version te=
st_1<br>
++Zone Africa/Bissau -1:2:20 - LMT 1912 Ja 1 1u<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-1=
=C2=A0 =C2=A0 =C2=A0 - %z=C2=A0 1975<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=C2=
=A0 =C2=A0 =C2=A0 =C2=A0- GMT<br>
++Zon Some/Zone 1:2:3=C2=A0 =C2=A0- %z 1900<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1:23:45 - %z 1950<br>
++Zo Another/Zone 1:2:3 -=C2=A0 =C2=A0 =C2=A0AZ0=C2=A0 =C2=A0 =C2=A01901<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =
=C2=A0Roolz A%sZ=C2=A0 =C2=A0 2000<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =
=C2=A0Roolz SAZ/DAZ 2005<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0 =C2=A0 =
=C2=A0Roolz %z<br>
++Rule Roolz 1950 max - April 1 2 1 D<br>
++Rul=C2=A0 Roolz 1950 max - Oct=C2=A0 =C2=A01 1 0 S<br>
++Z Strange/Zone 1=C2=A0 =C2=A0 =C2=A0 =C2=A0- X%sX=C2=A0 =C2=A0 1980<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01=C2=A0 =C2=A0 =C2=
=A0 =C2=A0- FOO/BAR 1990<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02:00=C2=A0 =C2=A0 =
- %zzz=C2=A0 =C2=A0 1995<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:9=C2=A0 =C2=A0 =
=C2=A0- %zzz=C2=A0 =C2=A0 1996<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:8:7=C2=A0 =C2=A0=
- %zzz=C2=A0 =C2=A0 1997<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00:6:5.5 - %zzz=C2=
=A0 =C2=A0 1998<br>
++)&quot;;<br>
++<br>
++=C2=A0 const auto&amp; db =3D reload_tzdb();<br>
++=C2=A0 VERIFY( override_used ); // If this fails then XFAIL for the targe=
t.<br>
++=C2=A0 VERIFY( db.version =3D=3D &quot;test_1&quot; );<br>
++<br>
++=C2=A0 // Test formatting %z as<br>
++=C2=A0 auto tz =3D locate_zone(&quot;Africa/Bissau&quot;);<br>
++=C2=A0 auto inf =3D tz-&gt;get_info(sys_days(1974y/1/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;-01&quot; );<br>
++<br>
++=C2=A0 tz =3D locate_zone(&quot;Some/Zone&quot;);<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1899y/1/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+010203&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1955y/1/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+012345&quot; );<br>
++<br>
++=C2=A0 tz =3D locate_zone(&quot;Another/Zone&quot;);<br>
++=C2=A0 // Test formatting %s as the LETTER/S field from the active Rule.<=
br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1910y/January/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;ASZ&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1950y/January/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;ASZ&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1950y/June/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;ADZ&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1999y/January/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;ASZ&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1999y/July/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;ADZ&quot; );<br>
++=C2=A0 // Test formatting STD/DST according to the active Rule.<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(2000y/January/2));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;SAZ&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(2001y/January/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;SAZ&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(2001y/July/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;DAZ&quot; );<br>
++=C2=A0 // Test formatting %z as the offset determined by the active Rule.=
<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(2005y/January/2));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+01&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(2006y/January/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+01&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(2006y/July/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+02&quot; );<br>
++<br>
++=C2=A0 // Test formatting %z, %s and S/D for a Zone with no associated Ru=
les.<br>
++=C2=A0 tz =3D locate_zone(&quot;Strange/Zone&quot;);<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1979y/January/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;XX&quot; ); // No Rule means nothi=
ng to use for %s.<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1981y/July/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;FOO&quot; ); // Always standard ti=
me means first string.<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1994y/July/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+02zz&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1995y/July/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+0009zz&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1996y/July/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+000807zz&quot; );<br>
++=C2=A0 inf =3D tz-&gt;get_info(sys_days(1997y/July/1));<br>
++=C2=A0 VERIFY( inf.abbrev =3D=3D &quot;+000606zz&quot; );<br>
++}<br>
++<br>
++int main()<br>
++{<br>
++=C2=A0 test_format();<br>
++}<br>
+diff --git a/libstdc++-v3/testsuite/std/time/tzdb/1.cc b/libstdc++-v3/test=
suite/std/time/tzdb/1.cc<br>
+index 796f3a8b4256..7a31c1c20ba7 100644<br>
+--- a/libstdc++-v3/testsuite/std/time/tzdb/1.cc<br>
++++ b/libstdc++-v3/testsuite/std/time/tzdb/1.cc<br>
+@@ -39,11 +39,15 @@ test_locate()<br>
+=C2=A0 =C2=A0const tzdb&amp; db =3D get_tzdb();<br>
+=C2=A0 =C2=A0const time_zone* tz =3D db.locate_zone(&quot;GMT&quot;);<br>
+=C2=A0 =C2=A0VERIFY( tz !=3D nullptr );<br>
+-=C2=A0 VERIFY( tz-&gt;name() =3D=3D &quot;Etc/GMT&quot; );<br>
+=C2=A0 =C2=A0VERIFY( tz =3D=3D std::chrono::locate_zone(&quot;GMT&quot;) )=
;<br>
+=C2=A0 =C2=A0VERIFY( tz =3D=3D db.locate_zone(&quot;Etc/GMT&quot;) );<br>
+=C2=A0 =C2=A0VERIFY( tz =3D=3D db.locate_zone(&quot;Etc/GMT+0&quot;) );<br=
>
+ <br>
++=C2=A0 // Since 2022f GMT is now a Zone and Etc/GMT a link instead of vic=
e versa,<br>
++=C2=A0 // but only when using the vanguard format. As of 2024a, the main =
and<br>
++=C2=A0 // rearguard formats still have Etc/GMT as a Zone and GMT as a lin=
k.<br>
++=C2=A0 VERIFY( tz-&gt;name() =3D=3D &quot;GMT&quot; || tz-&gt;name() =3D=
=3D &quot;Etc/GMT&quot; );<br>
++<br>
+=C2=A0 =C2=A0VERIFY( db.locate_zone(db.current_zone()-&gt;name()) =3D=3D d=
b.current_zone() );<br>
+ }<br>
+ <br>
+-- <br>
+2.43.5<br>
+<br>
-- <br>
2.47.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#207584): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/207584" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/207584</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/109715703/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/109715703/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007e80c8062777a32f--

