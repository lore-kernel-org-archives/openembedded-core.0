Return-Path: <gtertych@cisco.com>
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id C454879101
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 02:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=40980; q=dns/txt;
	s=iport; t=1540868385; x=1542077985;
	h=references:from:to:cc:subject:in-reply-to:date:
	message-id:mime-version;
	bh=i/MwvAlsT6Agn9DpQkl3OHSColIxsnLuHKM9LLJq+IM=;
	b=iFdtvECNT5HkTyFNHa8huz5xtCCcAOexqk5+gGOLH1qTQbRYhuo5Iex5
	iEDhuRq2lCQo8YA++uNMstbvG/q0EouBq+Spafh+OPFUl396zTDB9EUep
	ZzSpXevU9Lh7aNRoKgp0tGYzR2F+6V4TCTaxVQ8W4LazjUQGEW6GJZU6M o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DeAADeyNdb/4QNJK1kHAEBAQQBAQc?=
	=?us-ascii?q?EAQGBVAQBAQsBggRmfyiMbIs6gg2JAA6OJoFmCwEBI4FUgnUCgy0hNwoNAQM?=
	=?us-ascii?q?BAQIBAQJtHAyFOgEBAQECARoBHUEFCwsYCRQRDwERGxsGE4MhAYFpAwgFCA+?=
	=?us-ascii?q?oJxGCUIU7gkINghgUDotFF4FBP4QjgSaBMEUEAYEXDCeFbwKIaQguhUGBRIR?=
	=?us-ascii?q?IiVcYLgmGaoZzgycYgVJMh0eGYok0gzx/hkSCQgIEBgUCFIFZIoFVcBU7gmw?=
	=?us-ascii?q?Jgh0XhUdagwyEbz0wAQEBAS2KKIJMAQE?=
X-IronPort-AV: E=Sophos;i="5.54,442,1534809600"; d="scan'208";a="462765655"
Received: from alln-core-10.cisco.com ([173.36.13.132])
	by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2018 02:59:39 +0000
Received: from think (ete-sjc-nat64-xlate1.cisco.com [10.41.64.216])
	(authenticated bits=0)
	by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTPSA id
	w9U2xcqm014839
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Tue, 30 Oct 2018 02:59:39 GMT
References: <20181010162511.7273-1-gtertych@cisco.com>
	<d74ab63e-2b8b-015f-2fba-2c693d56b594@gmail.com>
User-agent: mu4e 1.0; emacs 25.2.1
From: Grygorii Tertychnyi <gtertych@cisco.com>
To: akuster808 <akuster808@gmail.com>
In-reply-to: <d74ab63e-2b8b-015f-2fba-2c693d56b594@gmail.com>
Date: Tue, 30 Oct 2018 04:59:38 +0200
Message-ID: <87sh0ow351.fsf@cisco.com>
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: gtertych@cisco.com
X-Outbound-SMTP-Client: 10.41.64.216, ete-sjc-nat64-xlate1.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
Cc: xe-linux-external@cisco.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/3] cve-report: add scripts to generate CVE reports
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
X-List-Received-Date: Tue, 30 Oct 2018 02:59:44 -0000
Content-Type: text/plain; format=flowed


On Mon Oct29 2018 @ 23:29, akuster808 <akuster808@gmail.com> 
wrote:

> Grygorii,
>
> I was good to see you at OEDeM.

Thanks Armin.

> I have some feedback.
>
> On 10/10/18 9:25 AM, grygorii tertychnyi via Openembedded-core 
> wrote:
>> cvert-foss - generate CVE report for the list of packages.
>>   Analyze the whole image manifest to align with the complex
>>   CPE configurations.
>>
>> cvert-update - update NVD feeds and store CVE structues dump.
>>   CVE dump is a pickled representation of the cve_struct 
>>   dictionary.
>>
>> cvert.py - python library used by cvert-* scripts.
>>   NVD JSON Vulnerability Feeds 
>>   https://nvd.nist.gov/vuln/data-feeds#JSON_FEED
>>
>> Usage examples:
>>
>>   o Download CVE feeds to "nvdfeed" directory
>>     % cvert-update nvdfeed
>>   o Update CVE feeds and store a dump in a file
>>     % cvert-update --store cvedump nvdfeed
>>   o Generate a CVE report
>>     % cvert-foss --feed-dir nvdfeed --output report-foss.txt 
>>     cve-manifest
>>   o (faster) Use dump file to generate a CVE report
>>     % cvert-foss --restore cvedump --output report-foss.txt 
>>     cve-manifest
>>   o Generate a full report
>>     % cvert-foss --restore cvedump --show-description 
>>     --show-reference \
>>                  --output report-foss-full.txt cve-manifest 
>>                  report-foss-full.txt

Oh, there is a typo. "cvert-foss" script requires only one 
positional argument - "cve-manifest".
So, the "Generate a full report" command should look like this:

       % cvert-foss --restore cvedump --show-description 
       --show-reference \
                    --output report-foss-full.txt cve-manifest

Is not a big deal. Just to be on the same page.

>
> The cve-manifest, I could not figure out a way to create this 
> from the
> above steps. I had your patches included when I did an image 
> build then
> I got the "report-foss-full.txt" created. I am guessing I missed 
> some
> steps somewhere. Can you clarify?

I try to explain it this way:

There are three patches:
  o 1st is "cve-report: add scripts to generate CVE reports"
    "cvert-foss" takes the "cve-manifest" (input), and generates
    the CVE report (output). So, you are right, these scripts
    do not produce "cve-manifest" files.

  o 2nd is "cvert-kernel - generate CVE report for the Linux 
  kernel"
    "cvert-kernel" analyzes kernel git dir and generate the kernel 
    CVE report

  o 3rd is "cve-report.bbclass: add class"
    it generates "cve-manifest" file for the given <image> and 
    then
    calls "cvert-foss" to produce the CVE report.

So, if you applied all three patches, modified "local.conf" and 
run "bitbake -c report_cve <image>" the "cve-manifest" is 
generated as part of the "generate_report_handler" function of 
"cve-report.bbclass".

So, back to you question "how to generate cve-manifest", the 
easiest way is:

echo 'INHERIT += "cve-report"' >> conf/local.conf
echo 'CVE_REPORT_MODE[packageonly] = "1"' >> conf/local.conf
bitbake -c report_cve <image>

It is described in the 3rd patch. Here, in the 1st patch I 
described only the "cve-manifest" format. Same format is used by 
"cve-check-tool", it is well-known and simply enough, so, no need 
to change it.

Being a part of scripts directory it can be used outside of any 
bbclass. You can create simple manifests and generate CVE reports 
right on command line, simple example:

 % echo "python,3.5.5,CVE-2017-17522 CVE-2018-1061" > 
 cve-manifest.txt
 % ./cvert-foss --debug --feed-dir cve-feeds --output 
 report-foss.txt cve-manifest.txt
# 2018-10-29 19:27:48,673 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2002.meta
# 2018-10-29 19:27:50,250 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2002.json.gz
# 2018-10-29 19:27:53,537 % CVERT % DEBUG    % parsing year 2002
# 2018-10-29 19:27:53,575 % CVERT % DEBUG    % cve records: 6667
# 2018-10-29 19:27:53,605 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2003.meta
# 2018-10-29 19:27:55,121 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2003.json.gz
# 2018-10-29 19:27:57,360 % CVERT % DEBUG    % parsing year 2003
# 2018-10-29 19:27:57,369 % CVERT % DEBUG    % cve records: 8167
# 2018-10-29 19:27:57,382 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2004.meta
# 2018-10-29 19:27:58,825 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2004.json.gz
# 2018-10-29 19:28:01,595 % CVERT % DEBUG    % parsing year 2004
# 2018-10-29 19:28:01,613 % CVERT % DEBUG    % cve records: 10810
# 2018-10-29 19:28:01,636 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2005.meta
# 2018-10-29 19:28:03,008 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2005.json.gz
# 2018-10-29 19:28:06,088 % CVERT % DEBUG    % parsing year 2005
# 2018-10-29 19:28:06,119 % CVERT % DEBUG    % cve records: 15424
# 2018-10-29 19:28:06,152 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2006.meta
# 2018-10-29 19:28:07,627 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2006.json.gz
# 2018-10-29 19:28:11,392 % CVERT % DEBUG    % parsing year 2006
# 2018-10-29 19:28:11,439 % CVERT % DEBUG    % cve records: 22408
# 2018-10-29 19:28:11,489 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2007.meta
# 2018-10-29 19:28:13,163 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2007.json.gz
# 2018-10-29 19:28:17,432 % CVERT % DEBUG    % parsing year 2007
# 2018-10-29 19:28:17,478 % CVERT % DEBUG    % cve records: 28850
# 2018-10-29 19:28:17,530 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2008.meta
# 2018-10-29 19:28:19,195 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2008.json.gz
# 2018-10-29 19:28:22,937 % CVERT % DEBUG    % parsing year 2008
# 2018-10-29 19:28:23,489 % CVERT % DEBUG    % cve records: 35840
# 2018-10-29 19:28:23,556 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2009.meta
# 2018-10-29 19:28:25,127 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2009.json.gz
# 2018-10-29 19:28:29,013 % CVERT % DEBUG    % parsing year 2009
# 2018-10-29 19:28:29,049 % CVERT % DEBUG    % cve records: 40705
# 2018-10-29 19:28:29,104 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2010.meta
# 2018-10-29 19:28:31,082 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2010.json.gz
# 2018-10-29 19:28:35,571 % CVERT % DEBUG    % parsing year 2010
# 2018-10-29 19:28:35,609 % CVERT % DEBUG    % cve records: 45638
# 2018-10-29 19:28:35,677 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2011.meta
# 2018-10-29 19:28:37,263 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2011.json.gz
# 2018-10-29 19:28:43,598 % CVERT % DEBUG    % parsing year 2011
# 2018-10-29 19:28:43,630 % CVERT % DEBUG    % cve records: 50043
# 2018-10-29 19:28:43,739 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2012.meta
# 2018-10-29 19:28:45,264 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2012.json.gz
# 2018-10-29 19:28:49,718 % CVERT % DEBUG    % parsing year 2012
# 2018-10-29 19:28:49,755 % CVERT % DEBUG    % cve records: 55215
# 2018-10-29 19:28:49,830 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2013.meta
# 2018-10-29 19:28:51,455 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2013.json.gz
# 2018-10-29 19:28:56,101 % CVERT % DEBUG    % parsing year 2013
# 2018-10-29 19:28:56,142 % CVERT % DEBUG    % cve records: 60882
# 2018-10-29 19:28:56,210 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2014.meta
# 2018-10-29 19:28:57,977 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2014.json.gz
# 2018-10-29 19:29:02,677 % CVERT % DEBUG    % parsing year 2014
# 2018-10-29 19:29:03,693 % CVERT % DEBUG    % cve records: 68824
# 2018-10-29 19:29:03,783 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2015.meta
# 2018-10-29 19:29:05,820 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2015.json.gz
# 2018-10-29 19:29:09,577 % CVERT % DEBUG    % parsing year 2015
# 2018-10-29 19:29:09,632 % CVERT % DEBUG    % cve records: 76251
# 2018-10-29 19:29:09,720 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2016.meta
# 2018-10-29 19:29:11,362 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2016.json.gz
# 2018-10-29 19:29:17,063 % CVERT % DEBUG    % parsing year 2016
# 2018-10-29 19:29:17,128 % CVERT % DEBUG    % cve records: 84957
# 2018-10-29 19:29:17,238 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2017.meta
# 2018-10-29 19:29:19,102 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2017.json.gz
# 2018-10-29 19:29:25,282 % CVERT % DEBUG    % parsing year 2017
# 2018-10-29 19:29:25,377 % CVERT % DEBUG    % cve records: 98334
# 2018-10-29 19:29:25,564 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2018.meta
# 2018-10-29 19:29:27,195 % CVERT % DEBUG    % downloading 
  https://static.nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-2018.json.gz
# 2018-10-29 19:29:32,262 % CVERT % DEBUG    % parsing year 2018
# 2018-10-29 19:29:32,323 % CVERT % DEBUG    % cve records: 106349
# 2018-10-29 19:29:32,912 % CVERT % DEBUG    % match python 3.5.5: 
  cpe:2.3:a:python:python:*:*:*:*:*:*:*:*
# 2018-10-29 19:29:33,265 % CVERT % DEBUG    % ignore "*" in 
  cpe:2.3:a:python_software_foundation:python:*:*:*:*:*:*:*:*
# 2018-10-29 19:29:33,271 % CVERT % DEBUG    % match python 3.5.5: 
  cpe:2.3:a:python:python:*:*:*:*:*:*:*:*
# 2018-10-29 19:29:33,271 % CVERT % DEBUG    % unpatched 
  CVE-2017-18207 python,3.5.5
# 2018-10-29 19:29:33,486 % CVERT % DEBUG    % match python 3.5.5: 
  cpe:2.3:a:python:python:*:*:*:*:*:*:*:*
# 2018-10-29 19:29:33,487 % CVERT % DEBUG    %   patched 
  CVE-2018-1061 python,3.5.5
# 2018-10-29 19:29:33,772 % CVERT % DEBUG    % ignore "-" in 
  cpe:2.3:a:python:python:-:*:*:*:*:*:*:*
# 2018-10-29 19:29:34,585 % CVERT % DEBUG    % match python 3.5.5: 
  cpe:2.3:a:python:python:*:*:*:*:*:*:*:*
# 2018-10-29 19:29:34,585 % CVERT % DEBUG    % unpatched 
  CVE-2018-1060 python,3.5.5
# 2018-10-29 19:29:36,668 % CVERT % DEBUG    % match python 3.5.5: 
  cpe:2.3:a:python:python:*:*:*:*:*:*:*:*
# 2018-10-29 19:29:36,668 % CVERT % DEBUG    %   patched 
  CVE-2017-17522 python,3.5.5
 % cat report-foss.txt
  patched |  7.5 | CVE-2018-1061      | python | 3.5.5
  patched |  8.8 | CVE-2017-17522     | python | 3.5.5
unpatched |  6.5 | CVE-2017-18207     | python | 3.5.5
unpatched |  7.5 | CVE-2018-1060      | python | 3.5.5

Of course, it is better to use first "cvert-update --store ..." 
and then multiple times "cvert-foss --restore ..." - much faster 
on multiple runs.

> Also, is there a way to version the report file by image or 
> standard
> buildID so that I don't accidentally overwrite the txt 
> file. Maybe a
> future enhancement is to group the packages by layer. I ran this 
> with
> the meta-security layer and I now need to look up what packages 
> belong
> to what layer to go work on them.

I think it is possible, but again as part of bbclass 
enhancement. If I understood Richard correctly on OEDeM, the 
bbclass should be modified anyway ("do not copy 
functionality"). But these cvert scripts do not depend on it. And 
can be seen independently.

> Overall, I like this implementation and seems to be fast.
>
> Thanks for the patches.

Thanks. It is inspiring.

> kind regards,
>
> Armin
>
>>
>> Manifest example:
>>
>>   bash,4.2,CVE-2014-7187
>>   python,2.7.35,
>>   python,3.5.5,CVE-2017-17522 CVE-2018-1061
>>
>> Report example:
>>
>>     patched |  7.5 | CVE-2018-1061      | python | 3.5.5
>>     patched | 10.0 | CVE-2014-7187      | bash | 4.2
>>     patched |  8.8 | CVE-2017-17522     | python | 3.5.5
>>   unpatched | 10.0 | CVE-2014-6271      | bash | 4.2
>>   unpatched | 10.0 | CVE-2014-6277      | bash | 4.2
>>   unpatched | 10.0 | CVE-2014-6278      | bash | 4.2
>>   unpatched | 10.0 | CVE-2014-7169      | bash | 4.2
>>   unpatched | 10.0 | CVE-2014-7186      | bash | 4.2
>>   unpatched |  4.6 | CVE-2012-3410      | bash | 4.2
>>   unpatched |  8.4 | CVE-2016-7543      | bash | 4.2
>>   unpatched |  5.0 | CVE-2010-3492      | python | 2.7.35
>>   unpatched |  5.3 | CVE-2016-1494      | python | 2.7.35
>>   unpatched |  6.5 | CVE-2017-18207     | python | 3.5.5
>>   unpatched |  6.5 | CVE-2017-18207     | python | 2.7.35
>>   unpatched |  7.1 | CVE-2013-7338      | python | 2.7.35
>>   unpatched |  7.5 | CVE-2018-1060      | python | 3.5.5
>>   unpatched |  8.8 | CVE-2017-17522     | python | 2.7.35
>>
>> Signed-off-by: grygorii tertychnyi <gtertych@cisco.com>
>> ---
>>
>> Changes in v3:
>>  o better logging: cvert.py lib log messages are controlled by 
>>  cvert-* scripts
>>  o add more examples
>>  o add short params ("-o" "--output", "-f", "--feed-dir", etc)
>>  o fix double entries in manifest
>>  o fix pylint warnings
>>
>>  scripts/cvert-foss   | 151 ++++++++++++++++
>>  scripts/cvert-update |  79 +++++++++
>>  scripts/cvert.py     | 473 
>>  +++++++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 703 insertions(+)
>>  create mode 100755 scripts/cvert-foss
>>  create mode 100755 scripts/cvert-update
>>  create mode 100644 scripts/cvert.py
>>
>> diff --git a/scripts/cvert-foss b/scripts/cvert-foss
>> new file mode 100755
>> index 000000000000..00fbf2c0687b
>> --- /dev/null
>> +++ b/scripts/cvert-foss
>> @@ -0,0 +1,151 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Copyright (c) 2018 by Cisco Systems, Inc.
>> +#
>> +# This program is free software; you can redistribute it 
>> and/or modify
>> +# it under the terms of the GNU General Public License version 
>> 2 as
>> +# published by the Free Software Foundation.
>> +#
>> +# This program is distributed in the hope that it will be 
>> useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty 
>> of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See 
>> the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public 
>> License along
>> +# with this program; if not, write to the Free Software 
>> Foundation, Inc.,
>> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +#
>> +
>> +""" Generate CVE report for the given CVE manifest
>> +"""
>> +
>> +import sys
>> +import textwrap
>> +import argparse
>> +import logging
>> +import logging.config
>> +import cvert
>> +
>> +def report_foss():
>> +    """Generate CVE report"""
>> +
>> +    parser = argparse.ArgumentParser(
>> +        formatter_class=argparse.RawDescriptionHelpFormatter,
>> +        description=textwrap.dedent("""
>> +        Generate CVE report for the given CVE manifest.
>> +        """),
>> +        epilog=textwrap.dedent("""
>> +        @ run examples:
>> +
>> +        # Download (update) NVD feeds in "nvdfeed" directory
>> +        # and prepare the report for the "cve-manifest" file
>> +        %% %(prog)s --feed-dir nvdfeed --output 
>> report-foss.txt cve-manifest
>> +
>> +        # Use existed NVD feeds in "nvdfeed" directory
>> +        # and prepare the report for the "cve-manifest" file
>> +        %% %(prog)s --offline --feed-dir nvdfeed --output 
>> report-foss.txt cve-manifest
>> +
>> +        # (faster) Restore CVE dump from "cvedump" (must 
>> exist)
>> +        # and prepare the report for the "cve-manifest" file
>> +        %% %(prog)s --restore cvedump --output report-foss.txt 
>> cve-manifest
>> +
>> +        # Restore CVE dump from "cvedump" (must exist)
>> +        # and prepare the extended report for the 
>> "cve-manifest" file
>> +        %% %(prog)s --restore cvedump --show-description 
>> --show-reference --output report-foss.txt cve-manifest
>> +
>> +        @ manifest example:
>> +
>> +        bash,4.2,CVE-2014-7187
>> +        python,2.7.35,
>> +        python,3.5.5,CVE-2017-17522 CVE-2018-1061
>> +
>> +        @ report example output:
>> +
>> +        . patched | 10.0 | CVE-2014-7187      | bash | 4.2
>> +        . patched |  7.5 | CVE-2018-1061      | python | 3.5.5
>> +        . patched |  8.8 | CVE-2017-17522     | python | 3.5.5
>> +        unpatched | 10.0 | CVE-2014-6271      | bash | 4.2
>> +        unpatched | 10.0 | CVE-2014-6277      | bash | 4.2
>> +        unpatched | 10.0 | CVE-2014-6278      | bash | 4.2
>> +        unpatched | 10.0 | CVE-2014-7169      | bash | 4.2
>> +        unpatched | 10.0 | CVE-2014-7186      | bash | 4.2
>> +        unpatched |  4.6 | CVE-2012-3410      | bash | 4.2
>> +        unpatched |  8.4 | CVE-2016-7543      | bash | 4.2
>> +        unpatched |  5.0 | CVE-2010-3492      | python | 
>> 2.7.35
>> +        unpatched |  5.3 | CVE-2016-1494      | python | 
>> 2.7.35
>> +        unpatched |  6.5 | CVE-2017-18207     | python | 3.5.5
>> +        unpatched |  6.5 | CVE-2017-18207     | python | 
>> 2.7.35
>> +        unpatched |  7.1 | CVE-2013-7338      | python | 
>> 2.7.35
>> +        unpatched |  7.5 | CVE-2018-1060      | python | 3.5.5
>> +        unpatched |  8.8 | CVE-2017-17522     | python | 
>> 2.7.35
>> +        """))
>> +
>> +    group = parser.add_mutually_exclusive_group(required=True)
>> +    group.add_argument("-f", "--feed-dir", help="feeds 
>> directory")
>> +    group.add_argument("-d", "--restore", help="load CVE data 
>> structures from file",
>> +                       metavar="FILENAME")
>> +    parser.add_argument("--offline", help="do not update from 
>> NVD site",
>> +                        action="store_true")
>> +    parser.add_argument("-o", "--output", help="save report to 
>> the file")
>> +    parser.add_argument("--show-description", help='show 
>> "Description" in the report',
>> +                        action="store_true")
>> +    parser.add_argument("--show-reference", help='show 
>> "Reference" in the report',
>> +                        action="store_true")
>> +    parser.add_argument("--debug", help="print debug 
>> messages",
>> +                        action="store_true")
>> +
>> +    parser.add_argument("cve_manifest", help="file with a list 
>> of packages, "
>> +                        "each line contains three comma 
>> separated values: name, "
>> +                        "version and a space separated list of 
>> patched CVEs, "
>> +                        "e.g.: python,3.5.5,CVE-2017-17522 
>> CVE-2018-1061",
>> +                        metavar="cve-manifest")
>> +
>> +    args = parser.parse_args()
>> +
>> +    logging.config.dictConfig(cvert.logconfig(args.debug))
>> +
>> +    cve_manifest = {}
>> +
>> +    with open(args.cve_manifest, "r") as fil:
>> +        for lin in fil:
>> +            lin = lin.rstrip()
>> +
>> +            # skip empty lines
>> +            if not lin:
>> +                continue
>> +
>> +            product, version, patched = lin.split(",", 
>> maxsplit=3)
>> +
>> +            if product in cve_manifest:
>> +                cve_manifest[product][version] = 
>> patched.split()
>> +            else:
>> +                cve_manifest[product] = {
>> +                    version: patched.split()
>> +                }
>> +
>> +    if args.restore:
>> +        cve_struct = cvert.load_cve(args.restore)
>> +    elif args.feed_dir:
>> +        cve_struct = cvert.update_feeds(args.feed_dir, 
>> args.offline)
>> +
>> +    if not cve_struct and args.offline:
>> +        parser.error("No CVEs found. Try to turn off offline 
>> mode or use other file to restore.")
>> +
>> +    if args.output:
>> +        output = open(args.output, "w")
>> +    else:
>> +        output = sys.stdout
>> +
>> +    report = cvert.generate_report(cve_manifest, cve_struct)
>> +
>> +    cvert.print_report(report,
>> +                       show_description=args.show_description,
>> +                       show_reference=args.show_reference,
>> +                       output=output)
>> +
>> +    if args.output:
>> +        output.close()
>> +
>> +
>> +if __name__ == "__main__":
>> +    report_foss()
>> diff --git a/scripts/cvert-update b/scripts/cvert-update
>> new file mode 100755
>> index 000000000000..3b3f5572a83c
>> --- /dev/null
>> +++ b/scripts/cvert-update
>> @@ -0,0 +1,79 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Copyright (c) 2018 by Cisco Systems, Inc.
>> +#
>> +# This program is free software; you can redistribute it 
>> and/or modify
>> +# it under the terms of the GNU General Public License version 
>> 2 as
>> +# published by the Free Software Foundation.
>> +#
>> +# This program is distributed in the hope that it will be 
>> useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty 
>> of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See 
>> the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public 
>> License along
>> +# with this program; if not, write to the Free Software 
>> Foundation, Inc.,
>> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +#
>> +
>> +""" Update NVD feeds and store CVE blob locally
>> +"""
>> +
>> +
>> +import textwrap
>> +import argparse
>> +import logging
>> +import logging.config
>> +import cvert
>> +
>> +
>> +def update_cvert():
>> +    """Update CVE storage"""
>> +
>> +    parser = argparse.ArgumentParser(
>> +        formatter_class=argparse.RawDescriptionHelpFormatter,
>> +        description=textwrap.dedent("""
>> +        Update NVD feeds and store CVE blob locally.
>> +        """),
>> +        epilog=textwrap.dedent("""
>> +        examples:
>> +
>> +        # Download NVD feeds to  "nvdfeed" directory.
>> +        # If there are meta files in the directory, they will 
>> be updated
>> +        # and only fresh archives will be downloaded
>> +        %% %(prog)s nvdfeed
>> +
>> +        # Inspect NVD feeds in "nvdfeed" directory
>> +        # and prepare a CVE dump python blob "cvedump".
>> +        # Use it later as input for cvert-* scripts (for 
>> speeding up)
>> +        %% %(prog)s --offline --store cvedump nvdfeed
>> +
>> +        # Download (update) NVD feeds and prepare the CVE dump
>> +        %% %(prog)s --store cvedump nvdfeed
>> +        """))
>> +
>> +    parser.add_argument("-d", "--store", help="save CVE data 
>> structures in file",
>> +                        metavar="FILENAME")
>> +    parser.add_argument("--offline", help="do not update from 
>> NVD site",
>> +                        action="store_true")
>> +    parser.add_argument("--debug", help="print debug 
>> messages",
>> +                        action="store_true")
>> +
>> +    parser.add_argument("feed_dir", help="feeds directory",
>> +                        metavar="feed-dir")
>> +
>> +    args = parser.parse_args()
>> +
>> +    logging.config.dictConfig(cvert.logconfig(args.debug))
>> +
>> +    cve_struct = cvert.update_feeds(args.feed_dir, 
>> args.offline)
>> +
>> +    if not cve_struct and args.offline:
>> +        parser.error("No CVEs found in {0}. Try turn off 
>> offline mode.".format(args.feed_dir))
>> +
>> +    if args.store:
>> +        cvert.save_cve(args.store, cve_struct)
>> +
>> +
>> +if __name__ == "__main__":
>> +    update_cvert()
>> diff --git a/scripts/cvert.py b/scripts/cvert.py
>> new file mode 100644
>> index 000000000000..f93b95c84965
>> --- /dev/null
>> +++ b/scripts/cvert.py
>> @@ -0,0 +1,473 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Copyright (c) 2018 by Cisco Systems, Inc.
>> +#
>> +# This program is free software; you can redistribute it 
>> and/or modify
>> +# it under the terms of the GNU General Public License version 
>> 2 as
>> +# published by the Free Software Foundation.
>> +#
>> +# This program is distributed in the hope that it will be 
>> useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty 
>> of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See 
>> the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public 
>> License along
>> +# with this program; if not, write to the Free Software 
>> Foundation, Inc.,
>> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
>> +#
>> +
>> +""" CVERT library: set of functions for CVE reports
>> +"""
>> +
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
>> +logging.getLogger(__name__).addHandler(logging.NullHandler())
>> +
>> +
>> +def generate_report(manifest, cve_struct):
>> +    """Generate CVE report"""
>> +
>> +    report = []
>> +
>> +    for cve in cve_struct:
>> +        affected = set()
>> +
>> +        for conf in cve_struct[cve]["nodes"]:
>> +            affected = 
>> affected.union(process_configuration(manifest, conf))
>> +
>> +        for key in affected:
>> +            product, version = key.split(",")
>> +            patched = manifest[product][version]
>> +
>> +            if cve in patched:
>> +                cve_item = {"status": "patched"}
>> +            else:
>> +                cve_item = {"status": "unpatched"}
>> +
>> +            cve_item["CVSS"] = 
>> "{0:.1f}".format(cve_struct[cve]["score"])
>> +            cve_item["CVE"] = cve
>> +            cve_item["product"] = product
>> +            cve_item["version"] = version
>> +            cve_item["description"] = 
>> cve_struct[cve]["description"]
>> +            cve_item["reference"] = [x["url"] for x in 
>> cve_struct[cve]["reference"]]
>> +
>> +            logging.debug("%9s %s %s,%s",
>> +                          cve_item["status"], cve_item["CVE"],
>> +                          cve_item["product"], 
>> cve_item["version"])
>> +
>> +            report.append(cve_item)
>> +
>> +    return sorted(report, key=lambda x: (x["status"], 
>> x["product"], x["CVSS"], x["CVE"]))
>> +
>> +
>> +def process_configuration(manifest, conf):
>> +    """Recursive call to process all CVE configurations"""
>> +
>> +    operator = conf["operator"]
>> +
>> +    if operator not in ["OR", "AND"]:
>> +        raise ValueError("operator {} is not 
>> supported".format(operator))
>> +
>> +    operator = True if operator == "AND" else False
>> +    match = False
>> +    affected = set()
>> +
>> +    if "cpe" in conf:
>> +        match = process_cpe(manifest, conf["cpe"][0], 
>> affected)
>> +
>> +        for cpe in conf["cpe"][1:]:
>> +            package_match = process_cpe(manifest, cpe, 
>> affected)
>> +
>> +            # match = match <operator> package_match
>> +            match = operator ^ ((operator ^ match) or 
>> (operator ^ package_match))
>> +    elif "children" in conf:
>> +        product_set = process_configuration(manifest, 
>> conf["children"][0])
>> +
>> +        if product_set:
>> +            match = True
>> +            affected = affected.union(product_set)
>> +
>> +        for child in conf["children"][1:]:
>> +            product_set = process_configuration(manifest, 
>> child)
>> +            package_match = True if product_set else False
>> +
>> +            # match = match OP package_match
>> +            match = operator ^ ((operator ^ match) or 
>> (operator ^ package_match))
>> +
>> +            if package_match:
>> +                affected = affected.union(product_set)
>> +
>> +    if match:
>> +        return affected
>> +
>> +    return ()
>> +
>> +
>> +def process_cpe(manifest, cpe, affected):
>> +    """Match CPE with all manifest packages"""
>> +
>> +    if not cpe["vulnerable"]:
>> +        # ignore non vulnerable part
>> +        return False
>> +
>> +    version_range = {}
>> +
>> +    for flag in ["versionStartIncluding",
>> +                 "versionStartExcluding",
>> +                 "versionEndIncluding",
>> +                 "versionEndExcluding"]:
>> +        if flag in cpe:
>> +            version_range[flag] = cpe[flag]
>> +
>> +    # take only "product" and "version"
>> +    product, version = cpe["cpe23Uri"].split(":")[4:6]
>> +
>> +    if product not in manifest:
>> +        return False
>> +
>> +    if not version_range:
>> +        if version == "*":
>> +            # ignore CVEs that touches all versions of 
>> package,
>> +            # can not fix it anyway
>> +            logging.debug('ignore "*" in %s', cpe["cpe23Uri"])
>> +            return False
>> +        elif version == "-":
>> +            # "-" means NA
>> +            #
>> +            # NA (i.e. "not applicable/not used"). The logical 
>> value NA
>> +            # SHOULD be assigned when there is no legal or 
>> meaningful
>> +            # value for that attribute, or when that attribute 
>> is not
>> +            # used as part of the description.
>> +            # This includes the situation in which an 
>> attribute has
>> +            # an obtainable value that is null
>> +            #
>> +            # Ignores CVEs if version is not set
>> +            logging.debug('ignore "-" in %s', cpe["cpe23Uri"])
>> +            return False
>> +        else:
>> +            version_range["versionExactMatch"] = version
>> +
>> +    result = False
>> +
>> +    for version in manifest[product]:
>> +        try:
>> +            if match_version(version,
>> +                             version_range):
>> +                logging.debug("match %s %s: %s", product, 
>> version, cpe["cpe23Uri"])
>> +                affected.add("{},{}".format(product, version))
>> +
>> +                result = True
>> +        except TypeError:
>> +            # version comparison is a very tricky
>> +            # sometimes provider changes product version in a 
>> strange manner
>> +            # and the above comparison just failed
>> +            # so here we try to make version string "more 
>> standard"
>> +
>> +            if match_version(twik_version(version),
>> +                             [twik_version(v) for v in 
>> version_range]):
>> +                logging.debug("match %s %s (twiked): %s", 
>> product, twik_version(version),
>> +                              cpe["cpe23Uri"])
>> +                affected.add("{},{}".format(product, version))
>> +
>> +                result = True
>> +
>> +    return result
>> +
>> +
>> +def match_version(version, vrange):
>> +    """Match version with the version range"""
>> +
>> +    result = False
>> +    version = util_version(version)
>> +
>> +    if "versionExactMatch" in vrange:
>> +        if version == 
>> util_version(vrange["versionExactMatch"]):
>> +            result = True
>> +    else:
>> +        result = True
>> +
>> +        if "versionStartIncluding" in vrange:
>> +            result = result and version >= 
>> util_version(vrange["versionStartIncluding"])
>> +
>> +        if "versionStartExcluding" in vrange:
>> +            result = result and version > 
>> util_version(vrange["versionStartExcluding"])
>> +
>> +        if "versionEndIncluding" in vrange:
>> +            result = result and version <= 
>> util_version(vrange["versionEndIncluding"])
>> +
>> +        if "versionEndExcluding" in vrange:
>> +            result = result and version < 
>> util_version(vrange["versionEndExcluding"])
>> +
>> +    return result
>> +
>> +
>> +def util_version(version):
>> +    """Simplify package version"""
>> +    return 
>> distutils.version.LooseVersion(version.split("+git")[0])
>> +
>> +
>> +def twik_version(version):
>> +    """Return "standard" version for complex cases"""
>> +    return "v1" + re.sub(r"^[a-zA-Z]+", "", version)
>> +
>> +
>> +def print_report(report, width=70, show_description=False, 
>> show_reference=False, output=sys.stdout):
>> +    """Print out final report"""
>> +
>> +    for cve in report:
>> +        print("{0:>9s} | {1:>4s} | {2:18s} | {3} | 
>> {4}".format(cve["status"], cve["CVSS"],
>> + 
>> cve["CVE"], cve["product"],
>> + 
>> cve["version"]),
>> +              file=output)
>> +
>> +        if show_description:
>> +            print("{0:>9s} + {1}".format(" ", "Description"), 
>> file=output)
>> +
>> +            for lin in textwrap.wrap(cve["description"], 
>> width=width):
>> +                print("{0:>9s}   {1}".format(" ", lin), 
>> file=output)
>> +
>> +        if show_reference:
>> +            print("{0:>9s} + {1}".format(" ", "Reference"), 
>> file=output)
>> +
>> +            for url in cve["reference"]:
>> +                print("{0:>9s}   {1}".format(" ", url), 
>> file=output)
>> +
>> +
>> +def update_feeds(feed_dir, offline=False, start=2002):
>> +    """Update all JSON feeds"""
>> +
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
>> +    """Update one JSON feed for the particular year"""
>> +
>> +    url_prefix = 
>> "https://static.nvd.nist.gov/feeds/json/cve/1.0"
>> +    file_prefix = "nvdcve-1.0-{0}".format(year)
>> +
>> +    meta = {
>> +        "url": "{0}/{1}.meta".format(url_prefix, file_prefix),
>> +        "file": os.path.join(feed_dir, 
>> "{0}.meta".format(file_prefix))
>> +    }
>> +
>> +    feed = {
>> +        "url": "{0}/{1}.json.gz".format(url_prefix, 
>> file_prefix),
>> +        "file": os.path.join(feed_dir, 
>> "{0}.json.gz".format(file_prefix))
>> +    }
>> +
>> +    ctx = {}
>> +
>> +    if not offline:
>> +        ctx = download_feed(meta, feed)
>> +
>> +        if not "meta" in ctx or not "feed" in ctx:
>> +            return
>> +
>> +    if not os.path.isfile(meta["file"]):
>> +        return
>> +
>> +    if not os.path.isfile(feed["file"]):
>> +        return
>> +
>> +    if not "meta" in ctx:
>> +        ctx["meta"] = ctx_meta(meta["file"])
>> +
>> +    if not "sha256" in ctx["meta"]:
>> +        return
>> +
>> +    if not "feed" in ctx:
>> +        ctx["feed"] = ctx_gzip(feed["file"], 
>> ctx["meta"]["sha256"])
>> +
>> +    if not ctx["feed"]:
>> +        return
>> +
>> +    logging.debug("parsing year %s", year)
>> +
>> +    for cve_item in ctx["feed"]["CVE_Items"]:
>> +        iden, cve = parse_item(cve_item)
>> +
>> +        if not iden:
>> +            continue
>> +
>> +        if not cve:
>> +            logging.error("%s parse error", iden)
>> +            break
>> +
>> +        if iden in cve_struct:
>> +            logging.error("%s duplicated", iden)
>> +            break
>> +
>> +        cve_struct[iden] = cve
>> +
>> +    logging.debug("cve records: %d", len(cve_struct))
>> +
>> +
>> +def ctx_meta(filename):
>> +    """Parse feed meta file"""
>> +
>> +    if not os.path.isfile(filename):
>> +        return {}
>> +
>> +    ctx = {}
>> +
>> +    with open(filename) as fil:
>> +        for lin in fil:
>> +            pair = lin.split(":", maxsplit=1)
>> +            ctx[pair[0]] = pair[1].rstrip()
>> +
>> +    return ctx
>> +
>> +
>> +def ctx_gzip(filename, checksum=""):
>> +    """Parse feed archive file"""
>> +
>> +    if not os.path.isfile(filename):
>> +        return {}
>> +
>> +    with gzip.open(filename) as fil:
>> +        try:
>> +            ctx = fil.read()
>> +        except (EOFError, OSError):
>> +            logging.error("failed to process gz archive %s", 
>> filename, exc_info=True)
>> +            return {}
>> +
>> +    if checksum and checksum.upper() != 
>> hashlib.sha256(ctx).hexdigest().upper():
>> +        return {}
>> +
>> +    return json.loads(ctx.decode())
>> +
>> +
>> +def parse_item(cve_item):
>> +    """Parse one JSON CVE entry"""
>> +
>> +    cve_id = cve_item["cve"]["CVE_data_meta"]["ID"][:]
>> +    impact = cve_item["impact"]
>> +
>> +    if not impact:
>> +        # REJECTed CVE
>> +        return None, None
>> +
>> +    if "baseMetricV3" in impact:
>> +        score = impact["baseMetricV3"]["cvssV3"]["baseScore"]
>> +    elif "baseMetricV2" in impact:
>> +        score = impact["baseMetricV2"]["cvssV2"]["baseScore"]
>> +    else:
>> +        return cve_id, None
>> +
>> +    return cve_id, {
>> +        "score": score,
>> +        "nodes": cve_item["configurations"]["nodes"][:],
>> +        "reference": 
>> cve_item["cve"]["references"]["reference_data"][:],
>> +        "description": 
>> cve_item["cve"]["description"]["description_data"][0]["value"]
>> +    }
>> +
>> +
>> +def download_feed(meta, feed):
>> +    """Download and parse feed"""
>> +
>> +    ctx = {}
>> +
>> +    if not retrieve_url(meta["url"], meta["file"]):
>> +        return {}
>> +
>> +    ctx["meta"] = ctx_meta(meta["file"])
>> +
>> +    if not "sha256" in ctx["meta"]:
>> +        return {}
>> +
>> +    ctx["feed"] = ctx_gzip(feed["file"], 
>> ctx["meta"]["sha256"])
>> +
>> +    if not ctx["feed"]:
>> +        if not retrieve_url(feed["url"], feed["file"]):
>> +            return {}
>> +
>> +        ctx["feed"] = ctx_gzip(feed["file"], 
>> ctx["meta"]["sha256"])
>> +
>> +    return ctx
>> +
>> +
>> +def retrieve_url(url, filename=None):
>> +    """Download file by URL"""
>> +
>> +    if filename:
>> +        os.makedirs(os.path.dirname(filename), exist_ok=True)
>> +
>> +    logging.debug("downloading %s", url)
>> +
>> +    try:
>> +        urllib.request.urlretrieve(url, filename=filename)
>> +    except urllib.error.HTTPError:
>> +        logging.error("failed to download URL %s", url, 
>> exc_info=True)
>> +        return False
>> +
>> +    return True
>> +
>> +
>> +def logconfig(debug_flag=False):
>> +    """Return default log config"""
>> +
>> +    return {
>> +        "version": 1,
>> +        "formatters": {
>> +            "f": {
>> +                "format": "# %(asctime)s %% CVERT %% 
>> %(levelname)-8s %% %(message)s"
>> +            }
>> +        },
>> +        "handlers": {
>> +            "h": {
>> +                "class": "logging.StreamHandler",
>> +                "formatter": "f",
>> +                "level": logging.DEBUG if debug_flag else 
>> logging.INFO
>> +            }
>> +        },
>> +        "root": {
>> +            "handlers": ["h"],
>> +            "level": logging.DEBUG if debug_flag else 
>> logging.INFO
>> +        },
>> +    }
>> +
>> +
>> +def save_cve(filename, cve_struct):
>> +    """Save CVE structure in the file"""
>> +
>> +    filename = os.path.realpath(filename)
>> +
>> +    logging.debug("saving %d CVE records to %s", 
>> len(cve_struct), filename)
>> +
>> +    with open(filename, "wb") as fil:
>> +        pickle.dump(cve_struct, fil)
>> +
>> +
>> +def load_cve(filename):
>> +    """Load CVE structure from the file"""
>> +
>> +    filename = os.path.realpath(filename)
>> +
>> +    logging.debug("loading from %s", filename)
>> +
>> +    with open(filename, "rb") as fil:
>> +        cve_struct = pickle.load(fil)
>> +
>> +    logging.debug("cve records: %d", len(cve_struct))
>> +
>> +    return cve_struct

