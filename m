Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A234B6FF01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 20:05:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 29 Feb 2016 12:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; 
	d="scan'208,217";a="755459168"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.118])
	([10.219.16.118])
	by orsmga003.jf.intel.com with ESMTP; 29 Feb 2016 12:05:26 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<5648c9e910e63de9aa29e1625ddab5e3804f179e.1456327117.git.mariano.lopez@linux.intel.com>
	<CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <56D4A4AA.6030404@linux.intel.com>
Date: Mon, 29 Feb 2016 14:06:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] cve-check.bbclass: Add class
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
X-List-Received-Date: Mon, 29 Feb 2016 20:05:27 -0000
Content-Type: multipart/alternative;
	boundary="------------050709090304090801050002"

--------------050709090304090801050002
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/29/2016 08:50 AM, Burton, Ross wrote:
> On 24 February 2016 at 15:27, <mariano.lopez@linux.intel.com 
> <mailto:mariano.lopez@linux.intel.com>> wrote:
>
>     +do_cve_check[depends] = "cve-check-tool-native:do_populate_cve_db"
>
>
>
> And cve-check-tool-native:do_populate_sysroot.

cve-check-tool-native:do_populate_cve_db depends on 
cve-check-tool-native:do_populate_sysroot, so adding it there would be 
redundant.
>
>     +def get_patches_cves(d):
>     +    """
>     +    Get patches that solve CVEs using the "CVE: " tag.
>     +    """
>     +
>     +    import re
>     +
>     +    pn = d.getVar("PN", True)
>     +    cve_match = re.compile("CVE:( CVE\-\d+\-\d+)+")
>
>
> How does this work as the backslashes are escaping the - and d and d?  
> Use r"" strings.

The backslashes just escape the "-", the "d" is the same as with the raw 
string. I don't really see the need to use r"" here.

>
>     +   patched_cves = set()
>     +    for url in src_patches(d):
>     +        patch_file = bb.fetch.decodeurl(url)[2]
>     +        with open(patch_file, "r") as f:
>     +            patch_text = f.read()
>     +
>     +        # Search for the "CVE: " line
>     +        match = cve_match.search(patch_text)
>     +        if match:
>     +            # Get only the CVEs without the "CVE: " tag
>     +            cves = patch_text[match.start()+5:match.end()]
>     +            for cve in cves.split():
>     +                patched_cves.add(cve)
>
>
> Breaks for patches such as this in glibc:
>
> meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch:CVE: CVE-2015-9761 
> patch #1
>
> I'd probably look for a line that starts with "CVE:" and the use 
> re.findall to find all strings matching r"CVE-\d{4}-\d+"

What do you mean by break? It does catch the CVE just fine, to test it 
just revert the glibc 2.23 update. I find cleaner to match the string in 
a single operation instead of searching for the tag line by line and 
then match the CVEs.

>     +def get_cve_info(d, cves):
>     +    """
>     +    Get CVE information from the database used by cve-check-tool.
>     +    """
>     +
>     +    try:
>     +        import sqlite3
>     +    except ImportError:
>     +        from pysqlite2 import dbapi2 as sqlite3
>
>
> Isn't the output from cve-check-tool good enough? Would it be nicer to 
> extend the log instead of assuming that the database format won't ever 
> change?

The output from cve-check-tool is only the CVE number, if that is good 
enough, the query to the database can be removed.

>
>     +def cve_write_data(d, patched, unpatched, cve_data):
>     +    """
>     +    Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
>     +    CVE manifest if enabled.
>     +    """
>     +
>     +    from bb.utils import mkdirhier
>     +
>     +    cve_file = d.getVar("CVE_CHECK_LOCAL_FILE", True)
>     +    nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
>     +    write_string = ""
>     +    mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR", True))
>     +
>     +    for cve in sorted(cve_data):
>     +        write_string += "PACKAGE NAME: %s\n" % d.getVar("PN", True)
>     +        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV",
>     True)
>     +        write_string += "CVE: %s\n" % cve
>     +        if cve in patched:
>     +            write_string += "CVE STATUS: Patched\n"
>     +        else:
>     +            write_string += "CVE STATUS: Unpatched\n"
>     +            bb.warn("Found unpatched CVE, for more information
>     check %s" % cve_file)
>     +        write_string += "CVE SUMMARY: %s\n" %
>     cve_data[cve]["summary"]
>     +        write_string += "CVSS v2 BASE SCORE: %s\n" %
>     cve_data[cve]["score"]
>     +        write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
>     +        write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link,
>     cve)
>     +
>     +    with open(cve_file, "w") as f:
>     +        f.write(write_string)
>
>
> Just write to the file instead of to a temporary string.

The temporary string is used for other two files, one could be copied, 
but the other appends the string content.

>
> Ross

I have implemented the rest of the comments, just need your input before 
sending a new version.

Mariano

--------------050709090304090801050002
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 02/29/2016 08:50 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com"
      type="cite">
      <div dir="ltr">On 24 February 2016 at 15:27, <span dir="ltr">&lt;<a
            moz-do-not-send="true"
            href="mailto:mariano.lopez@linux.intel.com" target="_blank"><a class="moz-txt-link-abbreviated" href="mailto:mariano.lopez@linux.intel.com">mariano.lopez@linux.intel.com</a></a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote"><br>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+do_cve_check[depends]
              = "cve-check-tool-native:do_populate_cve_db"<br>
            </blockquote>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>And cve-check-tool-native:do_populate_sysroot.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    cve-check-tool-native:do_populate_cve_db depends on
    cve-check-tool-native:do_populate_sysroot, so adding it there would
    be redundant.<br>
    <blockquote
cite="mid:CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+def
              get_patches_cves(d):<br>
              +    """<br>
              +    Get patches that solve CVEs using the "CVE: " tag.<br>
              +    """<br>
              +<br>
              +    import re<br>
              +<br>
              +    pn = d.getVar("PN", True)<br>
              +    cve_match = re.compile("CVE:( CVE\-\d+\-\d+)+")<br>
            </blockquote>
            <div><br>
            </div>
            <div>How does this work as the backslashes are escaping the
              - and d and d?  Use r"" strings.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    The backslashes just escape the "-", the "d" is the same as with the
    raw string. I don't really see the need to use r"" here.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+ 
                patched_cves = set()<br>
              +    for url in src_patches(d):<br>
              +        patch_file = bb.fetch.decodeurl(url)[2]<br>
              +        with open(patch_file, "r") as f:<br>
              +            patch_text = f.read()<br>
              +<br>
              +        # Search for the "CVE: " line<br>
              +        match = cve_match.search(patch_text)<br>
              +        if match:<br>
              +            # Get only the CVEs without the "CVE: " tag<br>
              +            cves =
              patch_text[match.start()+5:match.end()]<br>
              +            for cve in cves.split():<br>
              +                patched_cves.add(cve)<br>
              <br>
            </blockquote>
            <div><br>
            </div>
            <div>Breaks for patches such as this in glibc:</div>
            <div><br>
            </div>
            <div>meta/recipes-core/glibc/glibc/CVE-2015-9761_1.patch:CVE:
              CVE-2015-9761 patch #1</div>
            <div><br>
            </div>
            <div>I'd probably look for a line that starts with "CVE:"
              and the use re.findall to find all strings matching
              r"CVE-\d{4}-\d+"</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    What do you mean by break? It does catch the CVE just fine, to test
    it just revert the glibc 2.23 update. I find cleaner to match the
    string in a single operation instead of searching for the tag line
    by line and then match the CVEs.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+def
              get_cve_info(d, cves):<br>
              +    """<br>
              +    Get CVE information from the database used by
              cve-check-tool.<br>
              +    """<br>
              +<br>
              +    try:<br>
              +        import sqlite3<br>
              +    except ImportError:<br>
              +        from pysqlite2 import dbapi2 as sqlite3<br>
            </blockquote>
            <div><br>
            </div>
            <div>Isn't the output from cve-check-tool good enough? 
              Would it be nicer to extend the log instead of assuming
              that the database format won't ever change?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    The output from cve-check-tool is only the CVE number, if that is
    good enough, the query to the database can be removed.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+def
              cve_write_data(d, patched, unpatched, cve_data):<br>
              +    """<br>
              +    Write CVE information in WORKDIR; and to
              CVE_CHECK_DIR, and<br>
              +    CVE manifest if enabled.<br>
              +    """<br>
              +<br>
              +    from bb.utils import mkdirhier<br>
              +<br>
              +    cve_file = d.getVar("CVE_CHECK_LOCAL_FILE", True)<br>
              +    nvd_link = "<a moz-do-not-send="true"
                href="https://web.nvd.nist.gov/view/vuln/detail?vulnId="
                rel="noreferrer" target="_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=</a>"<br>
              +    write_string = ""<br>
              +    mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR", True))<br>
              +<br>
              +    for cve in sorted(cve_data):<br>
              +        write_string += "PACKAGE NAME: %s\n" %
              d.getVar("PN", True)<br>
              +        write_string += "PACKAGE VERSION: %s\n" %
              d.getVar("PV", True)<br>
              +        write_string += "CVE: %s\n" % cve<br>
              +        if cve in patched:<br>
              +            write_string += "CVE STATUS: Patched\n"<br>
              +        else:<br>
              +            write_string += "CVE STATUS: Unpatched\n"<br>
              +            bb.warn("Found unpatched CVE, for more
              information check %s" % cve_file)<br>
              +        write_string += "CVE SUMMARY: %s\n" %
              cve_data[cve]["summary"]<br>
              +        write_string += "CVSS v2 BASE SCORE: %s\n" %
              cve_data[cve]["score"]<br>
              +        write_string += "VECTOR: %s\n" %
              cve_data[cve]["vector"]<br>
              +        write_string += "MORE INFORMATION: %s%s\n\n" %
              (nvd_link, cve)<br>
              +<br>
              +    with open(cve_file, "w") as f:<br>
              +        f.write(write_string)<br>
            </blockquote>
            <div><br>
            </div>
            <div>Just write to the file instead of to a temporary
              string.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    The temporary string is used for other two files, one could be
    copied, but the other appends the string content.<br>
    <br>
    <blockquote
cite="mid:CAJTo0LbFnPEtokmGTK6-UzdGSEfNUz+vaHB=WhHQBQCs1HLbJw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Ross</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <div class="moz-signature">I have implemented the rest of the
      comments, just need your input before sending a new version.<br>
      <br>
      Mariano<br>
    </div>
  </body>
</html>

--------------050709090304090801050002--
