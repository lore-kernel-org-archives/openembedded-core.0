Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id ED19B71ABF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:17:29 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 09 May 2017 02:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,313,1491289200"; d="scan'208";a="99783930"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.25.11])
	by fmsmga006.fm.intel.com with ESMTP; 09 May 2017 02:17:29 -0700
Message-ID: <1494321448.10021.1.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 09 May 2017 10:17:28 +0100
In-Reply-To: <ecb02fcc0cbe4c1ea8967c80b9d1e6d14586ed2e.1494321164.git.Qi.Chen@windriver.com>
References: <cover.1494321164.git.Qi.Chen@windriver.com>
	<ecb02fcc0cbe4c1ea8967c80b9d1e6d14586ed2e.1494321164.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] cve-check.bbclass: make warning contain CVE IDs
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
X-List-Received-Date: Tue, 09 May 2017 09:17:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-05-09 at 17:13 +0800, Chen Qi wrote:
> When warning users about unpatched CVE, we'd better put CVE IDs into
> the warning message, so that it would be more straight forward for
> the
> user to know which CVEs are not patched.
> 
> So instead of:
>   WARNING: gnutls-3.5.9-r0 do_cve_check: Found unpatched CVE, for
> more information check /path/to/workdir/cve/cve.log.
> We should have:
>   WARNING: gnutls-3.5.9-r0 do_cve_check: Found unpatched CVE (CVE-
> 2017-7869), for more information check /path/to/workdir/cve/cve.log.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/cve-check.bbclass | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-
> check.bbclass
> index 0e4294f..496d744 100644
> --- a/meta/classes/cve-check.bbclass
> +++ b/meta/classes/cve-check.bbclass
> @@ -234,7 +234,8 @@ def cve_write_data(d, patched, unpatched,
> cve_data):
>      cve_file = d.getVar("CVE_CHECK_LOCAL_FILE")
>      nvd_link = "https://web.nvd.nist.gov/view/vuln/detail?vulnId="
>      write_string = ""
> -    first_alert = True
> +    has_unpatched_cve = False
> +    unpatched_cves = []
>      bb.utils.mkdirhier(d.getVar("CVE_CHECK_LOCAL_DIR"))
>  
>      for cve in sorted(cve_data):
> @@ -244,15 +245,17 @@ def cve_write_data(d, patched, unpatched,
> cve_data):
>          if cve in patched:
>              write_string += "CVE STATUS: Patched\n"
>          else:
> +            unpatched_cves.append(cve)
>              write_string += "CVE STATUS: Unpatched\n"
> -            if first_alert:
> -                bb.warn("Found unpatched CVE, for more information
> check %s" % cve_file)
> -                first_alert = False
> +            has_unpatched_cve = True
>          write_string += "CVE SUMMARY: %s\n" %
> cve_data[cve]["summary"]
>          write_string += "CVSS v2 BASE SCORE: %s\n" %
> cve_data[cve]["score"]
>          write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
>          write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link,
> cve)
>  
> +    if has_unpatched_cve:

There's no need for the has_unpatched_cve variable, you can just test
whether the unpatched_cves list is empty:

>>> foo = []
>>> bar = [1, 2, 3]
>>> if foo:
...   print("foo")
... 
>>> if bar:
...   print("bar")
... 
bar

Your conditional can just be:

  + if unpatched_cve:
> +        bb.warn("Found unpatched CVE (%s), for more information
> check %s" % (" ".join(unpatched_cves),cve_file))
> +
>      with open(cve_file, "w") as f:
>          bb.note("Writing file %s with CVE information" % cve_file)
>          f.write(write_string)
> -- 
> 1.9.1
> 

