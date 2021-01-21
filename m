Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web12.6029.1611230154464366196
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 03:55:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=wpn1S+9k;
 spf=pass (domain: burtonini.com, ip: 209.85.167.44, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f44.google.com with SMTP id u25so2142782lfc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Jan 2021 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yHfUFSW5gfHMlWvMNwVOhvqDoBGl8aEP7Vj+MwGbzc=;
        b=wpn1S+9kHIyHJRpiy2cDiTL+WQWmeVJkDzewMGuhXGWWCWJZ4Q5CMC1Gj6ETqgGKQn
         CGVagQSj88Ha/k5yixnj6brmASXzuhoAxx7d5KC+EhTmd+/gvA4/OtfkrfMu/GRbmWZ3
         aBTOGvqGyssZMisOcUpJBZecN2egjV07F4TYx+yPgDomDQ7UVozPQLDA1R+T0pMffOrd
         xC5oUNW78xc23GibmLzoYtiWyafyyJaduAjQbqeH4pr1nFUUn2qGtXZ1FjMOIqWurCZx
         u4GDKv5MQW4N3m0OQ9qz7nkU2+XVCLfJWQJ9ojF1GpVQSbvtr6KT/9YtImhZoF+yVOb6
         xroA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yHfUFSW5gfHMlWvMNwVOhvqDoBGl8aEP7Vj+MwGbzc=;
        b=a7564ILvX0M2MpK5+/qBwF3CCQ2AG2zz4mrssLVUc7kOiarELMIY0Je7SkwY10+3xh
         jZfefFAEPoRyBuR+B4jRfJRoXpqSNc9CMCFy9q2Xqtu2QwvY+U5utsBwEY2SSBGnACwc
         j+v/b3vCqVgB4HAhZuJmBhNZplqtJvbgI+Bb/tjjKkrKd4eDzjWSbBu47EbT6hSthwsR
         QV+mUPph5kdCqRZSi3fLAlNbj96AAGJn0IfMvWuMV+d8BKchzgcVmjMXGZtMP9BmjRBj
         RL+nHyseY6xHpItHjSXyaLedLoxHoy6Pl6K57q3biGyCmfWRAUektUbcnmAAAzpvAPGB
         naEw==
X-Gm-Message-State: AOAM531mibbYVl3wF5ncwLGrLq0q5vjZpolHB1IwZwL4Bi+rfa4GqOBB
	Omw0khh0qMu8Qe1L2kNNup2IwEIDhgfHc8z1gMGgQ1ceNfctqH2rkjg=
X-Google-Smtp-Source: ABdhPJx+32F/lTYZqm7uYgG/6VkbKAryTpfzNWIYVjybyQnH+z3TwuC5CoZlI9Nz6vXeM2YC07XS9xxya0ffvOE4exA=
X-Received: by 2002:a19:d07:: with SMTP id 7mr1580767lfn.215.1611230152487;
 Thu, 21 Jan 2021 03:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20210121022616.4451-1-chee.yang.lee@intel.com>
In-Reply-To: <20210121022616.4451-1-chee.yang.lee@intel.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 21 Jan 2021 11:55:41 +0000
Message-ID: <CAAnfSTsq+hZ1EgeaQinarKBf_CKeNMWok0azEmMA3RWem9UJCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: replace Looseversion with custom version class
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

The idea is good but this really needs a test suite.  If the class is
added to a new file meta/lib/oe/cvecheck.py or similar then you can
add a test suite too.

Ross

On Thu, 21 Jan 2021 at 02:26, Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> The way distutils.version.LooseVersion compare version are tricky, it treat
> all these ( "1.0-beta2", "1.0-rc1", "1.0A", "1.0p2" and "1.0pre1") as greater
> version than "1.0". This might be right for "1.0A" and "1.0p1" but not for
> the rest, also these version could be confusing, the "p" in "1.0p1" can be
> "pre" or "patched" version or even other meaning.
>
> replace Looseversion with custom class, it uses regex to capture common
> version format like "1.1.1" or tag format using date like "2020-12-12" as
> release section, check for following known string/label (beta, rc, pre, dev,
> alpha, preview) as pre-release section, any other trailing characters
> are difficult to understand and define so dont consider these when
> comparing. compare release section and pre-release section saperately.
>
> [YOCTO#14127]
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  meta/classes/cve-check.bbclass | 55 ++++++++++++++++++++++++++++++----
>  1 file changed, 50 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
> index d843e7c4ac..b119353781 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -206,7 +206,52 @@ def check_cves(d, patched_cves):
>      """
>      Connect to the NVD database and find unpatched cves.
>      """
> -    from distutils.version import LooseVersion
> +    import collections, re, itertools
> +
> +    _Version = collections.namedtuple(
> +        "_Version", ["release", "pre_l", "pre_v"]
> +    )
> +
> +    class Version():
> +        _version_pattern =  r"""v?(?:(?P<release>[0-9]+(?:[-\.][0-9]+)*)(?P<pre>[-_\.]?(?P<pre_l>(rc|alpha|beta|pre|preview|dev))[-_\.]?(?P<pre_v>[0-9]+)?)?)(.*)?"""
> +        _regex = re.compile(r"^\s*" + _version_pattern + r"\s*$", re.VERBOSE | re.IGNORECASE)
> +        def __init__(self, version):
> +            match = self._regex.search(version)
> +            if not match:
> +                raise Exception("Invalid version: '{0}'".format(version))
> +
> +            self._version = _Version(
> +                release=tuple(int(i) for i in match.group("release").replace("-",".").split(".")),
> +                pre_l=match.group("pre_l"),
> +                pre_v=match.group("pre_v")
> +            )
> +
> +            self._key = _cmpkey(
> +                self._version.release,
> +                self._version.pre_l,
> +                self._version.pre_v
> +            )
> +
> +        def __ge__(self, other):
> +            if not isinstance(other, Version):
> +                return NotImplemented
> +            return self._key >= other._key
> +
> +        def __gt__(self, other):
> +            if not isinstance(other, Version):
> +                return NotImplemented
> +            return self._key > other._key
> +
> +    def _cmpkey(release, pre_l, pre_v):
> +        # remove leading 0
> +        _release = tuple(
> +            reversed(list(itertools.dropwhile(lambda x: x == 0, reversed(release))))
> +        )
> +        if pre_l is None and pre_v is None:
> +            _pre = float('inf')
> +        else:
> +            _pre = float(pre_v) if pre_v else float('-inf')
> +        return _release, _pre
>
>      pn = d.getVar("PN")
>      real_pv = d.getVar("PV")
> @@ -263,8 +308,8 @@ def check_cves(d, patched_cves):
>                  else:
>                      if operator_start:
>                          try:
> -                            vulnerable_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
> -                            vulnerable_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
> +                            vulnerable_start =  (operator_start == '>=' and Version(pv) >= Version(version_start))
> +                            vulnerable_start |= (operator_start == '>' and Version(pv) > Version(version_start))
>                          except:
>                              bb.warn("%s: Failed to compare %s %s %s for %s" %
>                                      (product, pv, operator_start, version_start, cve))
> @@ -274,8 +319,8 @@ def check_cves(d, patched_cves):
>
>                      if operator_end:
>                          try:
> -                            vulnerable_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
> -                            vulnerable_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
> +                            vulnerable_end  = (operator_end == '<=' and Version(version_end) >= Version(pv))
> +                            vulnerable_end |= (operator_end == '<' and Version(version_end) > Version(pv) )
>                          except:
>                              bb.warn("%s: Failed to compare %s %s %s for %s" %
>                                      (product, pv, operator_end, version_end, cve))
> --
> 2.17.1
>
>
> 
>
