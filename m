Return-Path: <kamensky@cisco.com>
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id CBAA8608B7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 02:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=42798; q=dns/txt;
	s=iport; t=1533437530; x=1534647130;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=NQ4VEU52lmxwp+DOlOxZbnMCR2o1no9u/zI4itwbuBg=;
	b=TmBMzc4qLkRGEIehmc3Up2lymoErXX6nIkCBAQT5QiGVcgedRWgNNMjl
	tq3CuORLWi50ez9qvdKizKKQORT605WDsfOedalcI28mj7J8aNgOE76fw
	TX6ynzx2KuFFmBhD6PMT8Yezh0QbvnHgblSO2eNldBd+fX3ZHunE35cfh 8=;
X-IronPort-AV: E=Sophos;i="5.51,446,1526342400"; d="scan'208";a="153349999"
Received: from alln-core-7.cisco.com ([173.36.13.140])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Aug 2018 02:52:08 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id w752q8RV013805
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 5 Aug 2018 02:52:08 GMT
Date: Sat, 4 Aug 2018 19:52:07 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	"Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>
In-Reply-To: <CANNYZj8Kfk215Qgh+tNaeGnqAjSEy2tinRLFbyTq8SWt=mkdww@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1808041914590.23680@sjc-ads-6991.cisco.com>
References: <1533335883158.4719@cisco.com>
	<CANNYZj8Kfk215Qgh+tNaeGnqAjSEy2tinRLFbyTq8SWt=mkdww@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.30.218.111, sjc-ads-6991.cisco.com
X-Outbound-Node: alln-core-7.cisco.com
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cve-report: add scripts to generate CVE reports
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
X-List-Received-Date: Sun, 05 Aug 2018 02:52:09 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII



On Sat, 4 Aug 2018, Alexander Kanavin wrote:

> How reliable is NVD database for such automated scans? Previously, we
> have repeatedly concluded that it should not be trusted, and proper
> patching of vulnerabilities must involve humans looking at
> vulnerability reports and making appropriate decisions - same as
> Debian is doing for example.

I don't think scanning NVD database and generating proper
reports and having people looking at vulnerability reports are
mutually exclusive. I think rather both should be done.

The patches and tools we are proposing do scanning and
reporting, while looking at versions, pattches applied, for
a given image. Correctly analazying CVEs and applying right
patches is a separate thing.

Just an example please find below reports generated for sumo
that I pulled today, core-image-lsb image qemux86-64 MACHINE.

As one may see in below report it is not perfect. There are
clearly false positives, misplaced entries based on, as you
mentioned on not fully reliable NVD data. I.e CVE-2013-4598
reported against gcc the one I could spot - it is wrong. But it
does not negate value of cases where it is reported correctly.
So it boils down to a question whether value of useful signal
against cost of filtering some noise. From our experience using
this tool for a while internally to fix outstanding CVEs for
krogoth branch, the right signal definitely has very good value.

Grygorii, btw I had trouble pulling your patches from email,
it seems that there were posted as Text/HTML (at least it is what
my mailer tells me). Could you please repost them as Text/PLAIN,
i.e using git send-mail

report-foss.txt:

   patched |  5.5 | CVE-2017-15873     | busybox | 1.27.2
   patched |  8.8 | CVE-2017-16544     | busybox | 1.27.2
   patched |  6.5 | CVE-2016-3189      | bzip2 | 1.0.6
   patched |  7.5 | CVE-2017-9814      | cairo | 1.14.12
   patched |  9.8 | CVE-2016-6354      | flex | 2.6.0
   patched |  7.3 | CVE-2015-8560      | foomatic-filters | 4.0.17
   patched |  7.5 | CVE-2015-8327      | foomatic-filters | 4.0.17
   patched |  7.8 | CVE-2017-11714     | ghostscript | 9.21
   patched |  7.8 | CVE-2017-9835      | ghostscript | 9.21
   patched |  8.1 | CVE-2018-11236     | glibc | 2.27
   patched |  6.5 | CVE-2017-14166     | libarchive | 3.3.2
   patched |  7.5 | CVE-2017-14502     | libarchive | 3.3.2
   patched |  5.5 | CVE-2017-8361      | libsndfile | 1.0.28
   patched |  5.5 | CVE-2017-8362      | libsndfile | 1.0.28
   patched |  5.5 | CVE-2017-8363      | libsndfile | 1.0.28
   patched |  5.5 | CVE-2017-8365      | libsndfile | 1.0.28
   patched |  8.8 | CVE-2017-6892      | libsndfile | 1.0.28
   patched |  6.5 | CVE-2017-18013     | libtiff | 4.0.9
   patched |  6.5 | CVE-2018-10963     | libtiff | 4.0.9
   patched |  6.5 | CVE-2018-5784      | libtiff | 4.0.9
   patched |  6.5 | CVE-2018-7456      | libtiff | 4.0.9
   patched |  8.8 | CVE-2018-8905      | libtiff | 4.0.9
   patched |  6.5 | CVE-2017-14633     | libvorbis | 1.3.5
   patched |  9.8 | CVE-2017-14632     | libvorbis | 1.3.5
   patched |  7.5 | CVE-2018-6951      | patch | 2.7.6
   patched |  7.8 | CVE-2018-1000156   | patch | 2.7.6
   patched |  7.5 | CVE-2017-12837     | perl | 5.24.1
   patched |  9.1 | CVE-2017-12883     | perl | 5.24.1
   patched |  7.5 | CVE-2017-8779      | rpcbind | 0.2.4
   patched |  4.0 | CVE-2014-9913      | unzip | 6.0
   patched |  4.0 | CVE-2016-9844      | unzip | 6.0
   patched |  4.3 | CVE-2015-7697      | unzip | 6.0
   patched |  5.0 | CVE-2014-9636      | unzip | 6.0
   patched |  6.8 | CVE-2015-7696      | unzip | 6.0
   patched |  5.3 | CVE-2017-13078     | wpa_supplicant | 2.6
   patched |  5.3 | CVE-2017-13079     | wpa_supplicant | 2.6
   patched |  5.3 | CVE-2017-13080     | wpa_supplicant | 2.6
   patched |  5.3 | CVE-2017-13081     | wpa_supplicant | 2.6
   patched |  5.3 | CVE-2017-13087     | wpa_supplicant | 2.6
   patched |  5.3 | CVE-2017-13088     | wpa_supplicant | 2.6
   patched |  6.8 | CVE-2017-13077     | wpa_supplicant | 2.6
   patched |  6.8 | CVE-2017-13086     | wpa_supplicant | 2.6
   patched |  8.1 | CVE-2017-13082     | wpa_supplicant | 2.6
unpatched |  5.5 | CVE-2018-10372     | binutils | 2.30
unpatched |  5.5 | CVE-2018-10534     | binutils | 2.30
unpatched |  5.5 | CVE-2018-10535     | binutils | 2.30
unpatched |  5.5 | CVE-2018-6759      | binutils | 2.30
unpatched |  5.5 | CVE-2018-6872      | binutils | 2.30
unpatched |  5.5 | CVE-2018-7568      | binutils | 2.30
unpatched |  5.5 | CVE-2018-7569      | binutils | 2.30
unpatched |  5.5 | CVE-2018-7570      | binutils | 2.30
unpatched |  5.5 | CVE-2018-7642      | binutils | 2.30
unpatched |  5.5 | CVE-2018-8945      | binutils | 2.30
unpatched |  5.5 | CVE-2018-9138      | binutils | 2.30
unpatched |  5.5 | CVE-2018-9996      | binutils | 2.30
unpatched |  6.5 | CVE-2018-10373     | binutils | 2.30
unpatched |  7.8 | CVE-2018-6543      | binutils | 2.30
unpatched |  7.8 | CVE-2018-7208      | binutils | 2.30
unpatched |  7.8 | CVE-2018-7643      | binutils | 2.30
unpatched |  5.5 | CVE-2017-15874     | busybox | 1.27.2
unpatched |  4.7 | CVE-2017-18018     | coreutils | 8.29
unpatched |  2.6 | CVE-2015-2987      | ed | 1.14.2
unpatched |  7.8 | CVE-2018-8769      | elfutils | 0.170
unpatched |  2.6 | CVE-2009-1879      | flex | 2.6.0
unpatched |  4.3 | CVE-2015-1773      | flex | 2.6.0
unpatched |  5.0 | CVE-2013-4598      | gcc | 7.3.0
unpatched |  5.5 | CVE-2017-8908      | ghostscript | 9.21
unpatched |  7.8 | CVE-2017-7948      | ghostscript | 9.21
unpatched |  7.8 | CVE-2017-8291      | ghostscript | 9.21
unpatched |  7.8 | CVE-2018-11237     | glibc | 2.27
unpatched |  4.6 | CVE-2000-1214      | iputils | s20161105
unpatched |  7.5 | CVE-2000-1213      | iputils | s20161105
unpatched |  6.5 | CVE-2017-14501     | libarchive | 3.3.2
unpatched |  6.5 | CVE-2017-14503     | libarchive | 3.3.2
unpatched |  5.5 | CVE-2017-7960      | libcroco | 0.6.12
unpatched |  6.5 | CVE-2017-8834      | libcroco | 0.6.12
unpatched |  6.5 | CVE-2017-8871      | libcroco | 0.6.12
unpatched |  7.8 | CVE-2017-7961      | libcroco | 0.6.12
unpatched |  7.5 | CVE-2018-6829      | libgcrypt | 1.8.2
unpatched |  4.3 | CVE-2008-3964      | libpng | 1.6.34
unpatched |  6.5 | CVE-2017-14634     | libsndfile | 1.0.28
unpatched |  8.1 | CVE-2017-14245     | libsndfile | 1.0.28
unpatched |  8.1 | CVE-2017-14246     | libsndfile | 1.0.28
unpatched |  9.8 | CVE-2017-12562     | libsndfile | 1.0.28
unpatched |  6.5 | CVE-2018-10126     | libtiff | 4.0.9
unpatched |  8.8 | CVE-2017-17095     | libtiff | 4.0.9
unpatched |  8.8 | CVE-2017-17942     | libtiff | 4.0.9
unpatched |  5.5 | CVE-2017-11333     | libvorbis | 1.3.5
unpatched |  8.8 | CVE-2017-14160     | libvorbis | 1.3.5
unpatched |  5.0 | CVE-2011-4362      | lighttpd | 1.4.48
unpatched |  7.8 | CVE-2014-5220      | mdadm | 4.0
unpatched |  7.5 | CVE-2018-10754     | ncurses | 6.0+20171125
unpatched |  5.9 | CVE-2016-7055      | openssl | 1.0.2o
unpatched |  5.9 | CVE-2018-0737      | openssl | 1.0.2o
unpatched |  7.5 | CVE-2016-7798      | openssl | 1.0.2o
unpatched |  7.0 | CVE-2017-3604      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3605      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3606      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3607      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3608      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3609      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3610      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3611      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3612      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3613      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3614      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3615      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3616      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.0 | CVE-2017-3617      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.8 | CVE-2016-0682      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.8 | CVE-2016-0689      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.8 | CVE-2016-0692      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.8 | CVE-2016-0694      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.8 | CVE-2016-3418      | oracle_berkeley_db | 11.2.5.3.28
unpatched |  7.5 | CVE-2018-6952      | patch | 2.7.6
unpatched |  7.5 | CVE-2017-11164     | pcre | 8.41
unpatched |  7.5 | CVE-2018-12015     | perl | 5.24.1
unpatched |  7.5 | CVE-2018-6798      | perl | 5.24.1
unpatched |  7.8 | CVE-2016-1238      | perl | 5.24.1
unpatched |  9.8 | CVE-2018-6797      | perl | 5.24.1
unpatched |  9.8 | CVE-2018-6913      | perl | 5.24.1
unpatched |  5.0 | CVE-2010-3492      | python | 2.7.14
unpatched |  5.3 | CVE-2016-1494      | python | 2.7.14
unpatched |  6.5 | CVE-2017-18207     | python | 2.7.14
unpatched |  6.5 | CVE-2017-18207     | python | 3.5.5
unpatched |  7.1 | CVE-2013-7338      | python | 2.7.14
unpatched |  8.1 | CVE-2018-1000030   | python | 2.7.14
unpatched |  8.8 | CVE-2017-17522     | python | 2.7.14
unpatched |  8.8 | CVE-2017-17522     | python | 3.5.5
unpatched |  7.8 | CVE-2016-6252      | shadow | 4.2.1
unpatched |  9.8 | CVE-2017-12424     | shadow | 4.2.1
unpatched |  7.5 | CVE-2018-8740      | sqlite | 3.22.0
unpatched |  7.8 | CVE-2018-1000035   | unzip | 6.0
unpatched |  6.8 | CVE-2017-13084     | wpa_supplicant | 2.6
unpatched |  8.8 | CVE-2017-18266     | xdg-utils | 1.1.2

report-kernel.txt:

unpatched |  5.5 | CVE-2018-10021     | linux_kernel | 4.15.18
unpatched |  5.5 | CVE-2018-10074     | linux_kernel | 4.15.18
unpatched |  5.5 | CVE-2018-10322     | linux_kernel | 4.15.18
unpatched |  5.5 | CVE-2018-10323     | linux_kernel | 4.15.18
unpatched |  5.5 | CVE-2018-10940     | linux_kernel | 4.15.18
unpatched |  5.5 | CVE-2018-1118      | linux_kernel | 4.15.18
unpatched |  5.5 | CVE-2018-1130      | linux_kernel | 4.15.18
unpatched |  5.5 | CVE-2018-11508     | linux_kernel | 4.15.18
unpatched |  5.9 | CVE-2018-1108      | linux_kernel | 4.15.18
unpatched |  5.9 | CVE-2018-11412     | linux_kernel | 4.15.18
unpatched |  6.7 | CVE-2018-1068      | linux_kernel | 4.15.18
unpatched |  7.4 | CVE-2017-1000407   | linux_kernel | 4.15.18
unpatched |  7.5 | CVE-2017-1000410   | linux_kernel | 4.15.18
unpatched |  7.7 | CVE-2018-1000026   | linux_kernel | 4.15.18
unpatched |  7.8 | CVE-2018-11506     | linux_kernel | 4.15.18

Thanks,
Victor

> Alex
>
> 2018-08-04 0:37 GMT+02:00 Grygorii Tertychnyi (gtertych) via
> Openembedded-core <openembedded-core@lists.openembedded.org>:
>> cvert-kernel - generate CVE report for the Linux kernel.
>>   NVD entries for the Linux kernel is almost always outdated.
>>   For example, https://nvd.nist.gov/vuln/detail/CVE-2018-1065
>>   is shown as matched for "versions up to (including) 4.15.7",
>>   however the patch 57ebd808a97d has been back ported for 4.14.
>>   cvert-kernel script checks NVD Resource entries for the patch URLs
>>   and looking for the commits in the local git tree.
>>
>> cvert-foss - generate CVE report for the list of packages.
>>   It analyzes the whole image manifest to align with the complex
>>   CPE configurations.
>>
>> cvert-update - only update NVD feeds and store CVE blob locally.
>>   CVE blob is a pickled representation of the cve_struct dictionary.
>>
>> cvert.py - python module used by all cvert-* scripts.
>>   Uses NVD JSON Vulnerability Feeds https://nvd.nist.gov/vuln/data-feeds#JSON_FEED
>>
>> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
>> ---
>>  scripts/cvert-foss   | 109 ++++++++++++++
>>  scripts/cvert-kernel | 157 +++++++++++++++++++
>>  scripts/cvert-update |  64 ++++++++
>>  scripts/cvert.py     | 418 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  4 files changed, 748 insertions(+)
>>  create mode 100755 scripts/cvert-foss
>>  create mode 100755 scripts/cvert-kernel
>>  create mode 100755 scripts/cvert-update
>>  create mode 100644 scripts/cvert.py
>>
>> diff --git a/scripts/cvert-foss b/scripts/cvert-foss
>> new file mode 100755
>> index 0000000..a0cc6ad
>> --- /dev/null
>> +++ b/scripts/cvert-foss
>> @@ -0,0 +1,109 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Generate CVE report for the list of packages.
>> +#
>> +# Copyright (c) 2018 Cisco Systems, Inc.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License version 2 as
>> +# published by the Free Software Foundation.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License along
>> +# with this program; if not, write to the Free Software Foundation, Inc.,
>> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +#
>> +
>> +import sys
>> +import cvert
>> +import textwrap
>> +import argparse
>> +
>> +def report_foss(filename, cve_struct):
>> +    packagelist = {}
>> +
>> +    with open(filename, 'r') as fil:
>> +        for lin in fil:
>> +            product, version, patched = lin.split(',', maxsplit=3)
>> +
>> +            if product in packagelist:
>> +                packagelist[product][version] = patched.split()
>> +            else:
>> +                packagelist[product] = {
>> +                    version: patched.split()
>> +            }
>> +
>> +    return cvert.match_cve(packagelist, cve_struct)
>> +
>> +
>> +if __name__ == '__main__':
>> +    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
>> +                                     description=textwrap.dedent('''
>> +                                     Generate CVE report for the list of packages.
>> +                                     '''),
>> +                                     epilog=textwrap.dedent('''
>> +                                     examples:
>> +
>> +                                     # Download (update) NVD feeds in "nvdfeed" directory
>> +                                     # and prepare the report for the "package.lst" file
>> +                                     %% %(prog)s --feed-dir nvdfeed --output report-foss.txt package.lst
>> +
>> +                                     # Use existed NVD feeds in "nvdfeed" directory
>> +                                     # and prepare the report for the "package.lst" file
>> +                                     %% %(prog)s --offline --feed-dir nvdfeed --output report-foss.txt package.lst
>> +
>> +                                     # (faster) Restore CVE dump from "cvedump" (must exist)
>> +                                     # and prepare the report for the "package.lst" file
>> +                                     %% %(prog)s --restore cvedump --output report-foss.txt package.lst
>> +
>> +                                     # Restore CVE dump from "cvedump" (must exist)
>> +                                     # and prepare the extended report for the "package.lst" file
>> +                                     %% %(prog)s --restore cvedump --show-description --show-reference --output report-foss.txt package.lst
>> +                                     '''))
>> +
>> +    group = parser.add_mutually_exclusive_group(required=True)
>> +    group.add_argument('--feed-dir', help='feeds directory')
>> +    group.add_argument('--restore', help='load CVE data structures from file',
>> +                        metavar='FILENAME')
>> +
>> +    parser.add_argument('--offline', help='do not update from NVD site',
>> +                        action='store_true')
>> +    parser.add_argument('--output', help='save report to the file')
>> +    parser.add_argument('--show-description', help='show "Description" in the report',
>> +                        action='store_true')
>> +    parser.add_argument('--show-reference', help='show "Reference" in the report',
>> +                        action='store_true')
>> +
>> +    parser.add_argument('package_list', help='file with a list of packages, '
>> +                        'each line contains three comma separated values: name, '
>> +                        'version and a space separated list of patched CVEs.',
>> +                        metavar='package-list')
>> +
>> +    args = parser.parse_args()
>> +
>> +    if args.restore:
>> +        cve_struct = cvert.load_cve(args.restore)
>> +    elif args.feed_dir:
>> +        cve_struct = cvert.update_feeds(args.feed_dir, args.offline)
>> +
>> +    if not cve_struct and args.offline:
>> +        parser.error('No CVEs found. Try to turn off offline mode or use other file to restore.')
>> +
>> +    if args.output:
>> +        output = open(args.output, 'w')
>> +    else:
>> +        output = sys.stdout
>> +
>> +    report = report_foss(args.package_list, cve_struct)
>> +    cvert.print_report(report,
>> +                       show_description=args.show_description,
>> +                       show_reference=args.show_reference,
>> +                       output=output
>> +    )
>> +
>> +    if args.output:
>> +        output.close()
>> diff --git a/scripts/cvert-kernel b/scripts/cvert-kernel
>> new file mode 100755
>> index 0000000..446c7b2
>> --- /dev/null
>> +++ b/scripts/cvert-kernel
>> @@ -0,0 +1,157 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Generate CVE report for the Linux kernel.
>> +# Inspect Linux kernel GIT tree and find all CVE patches commits.
>> +#
>> +# Copyright (c) 2018 Cisco Systems, Inc.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License version 2 as
>> +# published by the Free Software Foundation.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License along
>> +# with this program; if not, write to the Free Software Foundation, Inc.,
>> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +#
>> +
>> +import re
>> +import cvert
>> +import argparse
>> +import textwrap
>> +import subprocess
>> +
>> +
>> +def report_kernel(cve_struct, kernel_dir, kernel_ver=None):
>> +    oneline = subprocess.check_output(['git', 'log',
>> +                                       '--format=%s'],
>> +                                      cwd=kernel_dir,
>> +                                      stderr=subprocess.DEVNULL
>> +    ).splitlines()
>> +
>> +    if not kernel_ver:
>> +        kernel_ver = subprocess.check_output(['make', 'kernelversion'],
>> +                                             cwd=kernel_dir,
>> +                                             stderr=subprocess.DEVNULL
>> +        ).decode().rstrip()
>> +
>> +    manifest = {
>> +        'linux_kernel': {
>> +            kernel_ver: []
>> +        }
>> +    }
>> +
>> +    report = cvert.match_cve(manifest, cve_struct)
>> +
>> +    for cve in report:
>> +        for url in cve['reference']:
>> +            headline = git_headline(kernel_dir, match_commit(url))
>> +
>> +            if headline and headline in oneline:
>> +                cve['status'] = 'patched'
>> +                break
>> +
>> +    return report
>> +
>> +
>> +def match_commit(url):
>> +    matched = re.match(r'^http://git\.kernel\.org/cgit/linux/kernel/git/torvalds/linux\.git/commit/\?id=(.+)$', url) \
>> +              or re.match(r'^https?://github\.com/torvalds/linux/commit/(.+)$', url)
>> +
>> +    if matched:
>> +        return matched.group(1)
>> +    else:
>> +        return None
>> +
>> +
>> +def git_headline(kernel_dir, commit_id):
>> +    if not commit_id:
>> +        return None
>> +
>> +    try:
>> +        headline = subprocess.check_output(['git', 'show',
>> +                                            '--no-patch',
>> +                                            '--format=%s',
>> +                                            commit_id],
>> +                                           cwd=kernel_dir,
>> +                                           stderr=subprocess.DEVNULL
>> +        ).rstrip()
>> +    except subprocess.CalledProcessError:
>> +        # commit_id is not found
>> +        headline = None
>> +
>> +    return headline
>> +
>> +
>> +if __name__ == '__main__':
>> +    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
>> +                                     description=textwrap.dedent('''
>> +                                     Generate CVE report for the Linux kernel.
>> +                                     Inspect Linux kernel GIT tree and find all CVE patches commits.
>> +                                     '''),
>> +                                     epilog=textwrap.dedent('''
>> +                                     examples:
>> +
>> +                                     # Download (update) NVD feeds in "nvdfeed" directory
>> +                                     # and prepare the report for the "kernel-sources" directory
>> +                                     %% %(prog)s --feed-dir nvdfeed --output report-kernel.txt kernel-sources
>> +
>> +                                     # Use existed NVD feeds in "nvdfeed" directory
>> +                                     # and prepare the report for the "kernel-sources" directory
>> +                                     %% %(prog)s --offline --feed-dir nvdfeed --output report-kernel.txt kernel-sources
>> +
>> +                                     # (faster) Restore CVE dump from "cvedump" (must exist)
>> +                                     # and prepare the report for the "kernel-sources" directory
>> +                                     %% %(prog)s --restore cvedump --output report-kernel.txt kernel-sources
>> +
>> +                                     # Restore CVE dump from "cvedump" (must exist)
>> +                                     # and prepare the extended report for the "kernel-sources" directory
>> +                                     %% %(prog)s --restore cvedump --show-description --show-reference --output report-kernel.txt kernel-sources
>> +                                     '''))
>> +
>> +    group = parser.add_mutually_exclusive_group(required=True)
>> +    group.add_argument('--feed-dir', help='feeds directory')
>> +    group.add_argument('--restore', help='load CVE data structures from file',
>> +                        metavar='FILENAME')
>> +
>> +    parser.add_argument('--offline', help='do not update from NVD site',
>> +                        action='store_true')
>> +    parser.add_argument('--output', help='save report to the file')
>> +    parser.add_argument('--kernel-ver', help='overwrite kernel version, default is "make kernelversion"',
>> +                        metavar='VERSION')
>> +    parser.add_argument('--show-description', help='show "Description" in the report',
>> +                        action='store_true')
>> +    parser.add_argument('--show-reference', help='show "Reference" in the report',
>> +                        action='store_true')
>> +
>> +    parser.add_argument('kernel_dir', help='kernel GIT directory',
>> +                        metavar='kernel-dir')
>> +
>> +    args = parser.parse_args()
>> +
>> +    if args.restore:
>> +        cve_struct = cvert.load_cve(args.restore)
>> +    elif args.feed_dir:
>> +        cve_struct = cvert.update_feeds(args.feed_dir, args.offline)
>> +
>> +    if not cve_struct and args.offline:
>> +        parser.error('No CVEs found. Try to turn off offline mode or use other file to restore.')
>> +
>> +    if args.output:
>> +        output = open(args.output, 'w')
>> +    else:
>> +        output = sys.stdout
>> +
>> +    report = report_kernel(cve_struct, args.kernel_dir, args.kernel_ver)
>> +    cvert.print_report(report,
>> +                       show_description=args.show_description,
>> +                       show_reference=args.show_reference,
>> +                       output=output
>> +    )
>> +
>> +    if args.output:
>> +        output.close()
>> diff --git a/scripts/cvert-update b/scripts/cvert-update
>> new file mode 100755
>> index 0000000..adea13d
>> --- /dev/null
>> +++ b/scripts/cvert-update
>> @@ -0,0 +1,64 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Update NVD feeds and store CVE blob locally.
>> +#
>> +# Copyright (c) 2018 Cisco Systems, Inc.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License version 2 as
>> +# published by the Free Software Foundation.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License along
>> +# with this program; if not, write to the Free Software Foundation, Inc.,
>> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +#
>> +
>> +import cvert
>> +import textwrap
>> +import argparse
>> +
>> +
>> +if __name__ == '__main__':
>> +    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
>> +                                     description=textwrap.dedent('''
>> +                                     Update NVD feeds and store CVE blob locally.
>> +                                     '''),
>> +                                     epilog=textwrap.dedent('''
>> +                                     examples:
>> +
>> +                                     # Download NVD feeds to  "nvdfeed" directory.
>> +                                     # If there are meta files in the directory, they will be updated
>> +                                     # and only fresh archives will be downloaded:
>> +                                     %% %(prog)s nvdfeed
>> +
>> +                                     # Inspect NVD feeds in "nvdfeed" directory
>> +                                     # and prepare a CVE dump python blob "cvedump".
>> +                                     # Use it later as input for cvert-* scripts (for speeding up)
>> +                                     %% %(prog)s --offline --store cvedump nvdfeed
>> +
>> +                                     # Download (update) NVD feeds and prepare a CVE dump
>> +                                     %% %(prog)s --store cvedump nvdfeed
>> +                                     '''))
>> +
>> +    parser.add_argument('--store', help='save CVE data structures in file',
>> +                        metavar='FILENAME')
>> +    parser.add_argument('--offline', help='do not update from NVD site',
>> +                        action='store_true')
>> +
>> +    parser.add_argument('feed_dir', help='feeds directory',
>> +                        metavar='feed-dir')
>> +
>> +    args = parser.parse_args()
>> +
>> +    cve_struct = cvert.update_feeds(args.feed_dir, args.offline)
>> +
>> +    if not cve_struct and args.offline:
>> +        parser.error('No CVEs found in {0}. Try to turn off offline mode.'.format(args.feed_dir))
>> +
>> +    if args.store:
>> +        cvert.save_cve(args.store, cve_struct)
>> diff --git a/scripts/cvert.py b/scripts/cvert.py
>> new file mode 100644
>> index 0000000..3a7ae5a
>> --- /dev/null
>> +++ b/scripts/cvert.py
>> @@ -0,0 +1,418 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Copyright (c) 2018 by Cisco Systems, Inc.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License version 2 as
>> +# published by the Free Software Foundation.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License along
>> +# with this program; if not, write to the Free Software Foundation, Inc.,
>> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +#
>> +
>> +import os
>> +import re
>> +import sys
>> +import json
>> +import gzip
>> +import pickle
>> +import logging
>> +import hashlib
>> +import datetime
>> +import textwrap
>> +import urllib.request
>> +import distutils.version
>> +
>> +
>> +stream = logging.StreamHandler()
>> +stream.setFormatter(logging.Formatter('# %(asctime)s %% %(name)s %% %(levelname)-8s %% %(message)s'))
>> +
>> +logger = logging.getLogger('CVERT')
>> +logger.setLevel(logging.DEBUG)
>> +logger.addHandler(stream)
>> +
>> +
>> +def match_cve(manifest, cve_struct):
>> +    report = []
>> +
>> +    for cve in cve_struct:
>> +        for conf in cve_struct[cve]['nodes']:
>> +            affected = process_configuration(manifest, conf)
>> +
>> +            for key in affected:
>> +                product, version = key.split(',')
>> +                patched = manifest[product][version]
>> +
>> +                if cve in patched:
>> +                    cve_item = {'status': 'patched'}
>> +                else:
>> +                    cve_item = {'status': 'unpatched'}
>> +
>> +                cve_item['CVSS'] = '{0:.1f}'.format(cve_struct[cve]['score'])
>> +                cve_item['CVE'] = cve
>> +                cve_item['product'] = product
>> +                cve_item['version'] = version
>> +                cve_item['description'] = cve_struct[cve]['description']
>> +                cve_item['reference'] = [x['url'] for x in cve_struct[cve]['reference']]
>> +
>> +                report.append(cve_item)
>> +
>> +    return sorted(report, key=lambda x : (x['status'], x['product'], x['CVSS'], x['CVE']))
>> +
>> +
>> +def process_configuration(manifest, conf):
>> +    '''Recursive call to process all CVE configurations.'''
>> +
>> +    operator = conf['operator']
>> +
>> +    if operator not in ['OR', 'AND']:
>> +        raise ValueError('operator {} is not supported'.format(operator))
>> +
>> +    op = True if operator == 'AND' else False
>> +    match = False
>> +    affected = set()
>> +
>> +    if 'cpe' in conf:
>> +        match = process_cpe(manifest, conf['cpe'][0], affected)
>> +
>> +        for cpe in conf['cpe'][1:]:
>> +            package_match = process_cpe(manifest, cpe, affected)
>> +
>> +            # match = match <operator> package_match
>> +            match = op ^ ((op ^ match) or (op ^ package_match))
>> +    elif 'children' in conf:
>> +        product_set = process_configuration(manifest, conf['children'][0])
>> +
>> +        if product_set:
>> +            match = True
>> +            affected = affected.union(product_set)
>> +
>> +        for child in conf['children'][1:]:
>> +            product_set = process_configuration(manifest, child)
>> +            package_match = True if product_set else False
>> +
>> +            # match = match OP package_match
>> +            match = op ^ ((op ^ match) or (op ^ package_match))
>> +
>> +            if package_match:
>> +                affected = affected.union(product_set)
>> +
>> +    if match:
>> +        return affected
>> +    else:
>> +        return ()
>> +
>> +
>> +def process_cpe(manifest, cpe, affected):
>> +    '''Matches CPE with all packages in manifest.'''
>> +
>> +    if not cpe['vulnerable']:
>> +        # Ignores non vulnerable part
>> +        return False
>> +
>> +    version_range = {}
>> +
>> +    for flag in ['versionStartIncluding',
>> +                 'versionStartExcluding',
>> +                 'versionEndIncluding',
>> +                 'versionEndExcluding']:
>> +        if flag in cpe:
>> +            version_range[flag] = cpe[flag]
>> +
>> +    # only "product" and "version" are taken
>> +    product, version = cpe['cpe23Uri'].split(':')[4:6]
>> +
>> +    if product not in manifest:
>> +        return False
>> +
>> +    if not version_range:
>> +        if version == '*':
>> +            # Ignores CVEs that touches all versions of package
>> +            # Can not fix it anyway
>> +            logger.debug('ignore "*" in {}'.format(cpe))
>> +            return False
>> +        elif version == '-':
>> +            # "-" means NA
>> +            #
>> +            # NA (i.e. "not applicable/not used"). The logical value NA
>> +            # SHOULD be assigned when there is no legal or meaningful
>> +            # value for that attribute, or when that attribute is not
>> +            # used as part of the description.
>> +            # This includes the situation in which an attribute has
>> +            # an obtainable value that is null
>> +            #
>> +            # Ignores CVEs if version is not set
>> +            logger.debug('ignore "-" in {}'.format(cpe))
>> +            return False
>> +        else:
>> +            version_range['versionExactMatch'] = version
>> +
>> +    result = False
>> +
>> +    for version in manifest[product]:
>> +        try:
>> +            if match_version(version,
>> +                             version_range):
>> +                logger.debug('{} {}'.format(product, version))
>> +                affected.add('{},{}'.format(product, version))
>> +
>> +                result = True
>> +        except:
>> +            # version comparison is a very tricky
>> +            # sometimes provider changes product version in a strange manner
>> +            # and the above comparison just failed
>> +            # so here we try to make version string "more standard"
>> +
>> +            if match_version(twik_version(version),
>> +                             [twik_version(v) for v in version_range]):
>> +                logger.debug('{} {} (twiked)'.format(product, twik_version(version)))
>> +                affected.add('{},{}'.format(product, version))
>> +
>> +                result = True
>> +
>> +    return result
>> +
>> +
>> +def match_version(version, vrange):
>> +    '''Matches version with the version range.'''
>> +
>> +    result = False
>> +    version = util_version(version)
>> +
>> +    if 'versionExactMatch' in vrange:
>> +        if version == util_version(vrange['versionExactMatch']):
>> +            result = True
>> +    else:
>> +        result = True
>> +
>> +        if 'versionStartIncluding' in vrange:
>> +            result = result and version >= util_version(vrange['versionStartIncluding'])
>> +
>> +        if 'versionStartExcluding' in vrange:
>> +            result = result and version > util_version(vrange['versionStartExcluding'])
>> +
>> +        if 'versionEndIncluding' in vrange:
>> +            result = result and version <= util_version(vrange['versionEndIncluding'])
>> +
>> +        if 'versionEndExcluding' in vrange:
>> +            result = result and version < util_version(vrange['versionEndExcluding'])
>> +
>> +    return result
>> +
>> +
>> +def util_version(version):
>> +    return distutils.version.LooseVersion(version.split('+git')[0])
>> +
>> +
>> +def twik_version(v):
>> +    return 'v1' + re.sub(r'^[a-zA-Z]+', '', v)
>> +
>> +
>> +def print_report(report, width=70, show_description=False, show_reference=False, output=sys.stdout):
>> +    for cve in report:
>> +        print('{0:>9s} | {1:>4s} | {2:18s} | {3} | {4}'.format(cve['status'], cve['CVSS'], cve['CVE'], cve['product'], cve['version']), file=output)
>> +
>> +        if show_description:
>> +            print('{0:>9s} + {1}'.format(' ', 'Description'), file=output)
>> +
>> +            for lin in textwrap.wrap(cve['description'], width=width):
>> +                print('{0:>9s}   {1}'.format(' ', lin), file=output)
>> +
>> +        if show_reference:
>> +            print('{0:>9s} + {1}'.format(' ', 'Reference'), file=output)
>> +
>> +            for url in cve['reference']:
>> +                print('{0:>9s}   {1}'.format(' ', url), file=output)
>> +
>> +
>> +def update_feeds(feed_dir, offline=False, start=2002):
>> +    feed_dir = os.path.realpath(feed_dir)
>> +    year_now = datetime.datetime.now().year
>> +    cve_struct = {}
>> +
>> +    for year in range(start, year_now + 1):
>> +        update_year(cve_struct, year, feed_dir, offline)
>> +
>> +    return cve_struct
>> +
>> +
>> +def update_year(cve_struct, year, feed_dir, offline):
>> +    url_prefix = 'https://static.nvd.nist.gov/feeds/json/cve/1.0'
>> +    file_prefix = 'nvdcve-1.0-{0}'.format(year)
>> +
>> +    meta = {
>> +        'url': '{0}/{1}.meta'.format(url_prefix, file_prefix),
>> +        'file': os.path.join(feed_dir, '{0}.meta'.format(file_prefix))
>> +    }
>> +
>> +    feed = {
>> +        'url': '{0}/{1}.json.gz'.format(url_prefix, file_prefix),
>> +        'file': os.path.join(feed_dir, '{0}.json.gz'.format(file_prefix))
>> +    }
>> +
>> +    ctx = {}
>> +
>> +    if not offline:
>> +        ctx = download_feed(meta, feed)
>> +
>> +        if not 'meta' in ctx or not 'feed' in ctx:
>> +            return
>> +
>> +    if not os.path.isfile(meta['file']):
>> +        return
>> +
>> +    if not os.path.isfile(feed['file']):
>> +        return
>> +
>> +    if not 'meta' in ctx:
>> +        ctx['meta'] = ctx_meta(meta['file'])
>> +
>> +    if not 'sha256' in ctx['meta']:
>> +        return
>> +
>> +    if not 'feed' in ctx:
>> +        ctx['feed'] = ctx_gzip(feed['file'], ctx['meta']['sha256'])
>> +
>> +    if not ctx['feed']:
>> +        return
>> +
>> +    logger.debug('parsing year {}'.format(year))
>> +
>> +    for cve_item in ctx['feed']['CVE_Items']:
>> +        iden, cve = parse_item(cve_item)
>> +
>> +        if not iden:
>> +            continue
>> +
>> +        if not cve:
>> +            logger.error('{} parse error'.format(iden))
>> +            break
>> +
>> +        if iden in cve_struct:
>> +            logger.error('{} duplicated'.format(iden))
>> +            break
>> +
>> +        cve_struct[iden] = cve
>> +
>> +    logger.debug('cve records: {}'.format(len(cve_struct)))
>> +
>> +
>> +def ctx_meta(filename):
>> +    if not os.path.isfile(filename):
>> +        return {}
>> +
>> +    ctx = {}
>> +
>> +    with open(filename) as fil:
>> +        for lin in fil:
>> +            f = lin.split(':', maxsplit=1)
>> +            ctx[f[0]] = f[1].rstrip()
>> +
>> +    return ctx
>> +
>> +
>> +def ctx_gzip(filename, checksum=''):
>> +    if not os.path.isfile(filename):
>> +        return {}
>> +
>> +    with gzip.open(filename) as fil:
>> +        try:
>> +            ctx = fil.read()
>> +        except (EOFError, OSError):
>> +            return {}
>> +
>> +    if checksum and checksum.upper() != hashlib.sha256(ctx).hexdigest().upper():
>> +        return {}
>> +
>> +    return json.loads(ctx.decode())
>> +
>> +
>> +def parse_item(cve_item):
>> +    cve_id = cve_item['cve']['CVE_data_meta']['ID'][:]
>> +    impact = cve_item['impact']
>> +
>> +    if not impact:
>> +        # REJECTed CVE
>> +        return None, None
>> +
>> +    if 'baseMetricV3' in impact:
>> +        score = impact['baseMetricV3']['cvssV3']['baseScore']
>> +    elif 'baseMetricV2' in impact:
>> +        score = impact['baseMetricV2']['cvssV2']['baseScore']
>> +    else:
>> +        return cve_id, None
>> +
>> +    return cve_id, {
>> +        'score': score,
>> +        'nodes': cve_item['configurations']['nodes'][:],
>> +        'reference': cve_item['cve']['references']['reference_data'][:],
>> +        'description': cve_item['cve']['description']['description_data'][0]['value']
>> +    }
>> +
>> +
>> +def download_feed(meta, feed):
>> +    ctx = {}
>> +
>> +    if not retrieve_url(meta['url'], meta['file']):
>> +        return {}
>> +
>> +    ctx['meta'] = ctx_meta(meta['file'])
>> +
>> +    if not 'sha256' in ctx['meta']:
>> +        return {}
>> +
>> +    ctx['feed'] = ctx_gzip(feed['file'], ctx['meta']['sha256'])
>> +
>> +    if not ctx['feed']:
>> +        if not retrieve_url(feed['url'], feed['file']):
>> +            return {}
>> +
>> +        ctx['feed'] = ctx_gzip(feed['file'], ctx['meta']['sha256'])
>> +
>> +    return ctx
>> +
>> +
>> +def retrieve_url(url, filename=None):
>> +    if filename:
>> +        os.makedirs(os.path.dirname(filename), exist_ok=True)
>> +
>> +    logger.debug('downloading {}'.format(url))
>> +
>> +    try:
>> +        urllib.request.urlretrieve(url, filename=filename)
>> +    except urllib.error.HTTPError:
>> +        return False
>> +
>> +    return True
>> +
>> +
>> +def save_cve(filename, cve_struct):
>> +    '''Saves CVE structure in the file.'''
>> +
>> +    filename = os.path.realpath(filename)
>> +
>> +    logger.debug('saving {} CVE records to {}'.format(len(cve_struct), filename))
>> +
>> +    with open(filename, 'wb') as fil:
>> +        pickle.dump(cve_struct, fil)
>> +
>> +
>> +def load_cve(filename):
>> +    '''Loads CVE structure from the file.'''
>> +
>> +    filename = os.path.realpath(filename)
>> +
>> +    logger.debug('loading from {}'.format(filename))
>> +
>> +    with open(filename, 'rb') as fil:
>> +        cve_struct = pickle.load(fil)
>> +
>> +    logger.debug('cve records: {}'.format(len(cve_struct)))
>> +
>> +    return cve_struct
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

