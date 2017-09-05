Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D1FAD77F69
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 08:31:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2017 01:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,479,1498546800"; d="scan'208";a="1011028119"
Received: from mknapp-mobl.amr.corp.intel.com (HELO
	jlock-mobl3.ger.corp.intel.com) ([10.252.28.122])
	by orsmga003.jf.intel.com with ESMTP; 05 Sep 2017 01:31:54 -0700
To: leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <20170904213548.15582-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170904213548.15582-2-leonardo.sandoval.gonzalez@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <69f4fc12-a0bf-c3de-351a-3c48bc4db92f@linux.intel.com>
Date: Tue, 5 Sep 2017 09:31:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170904213548.15582-2-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH 2/2] package_[deb|ipk]: improve multiprocess logic when creating deb/ipk packages
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
X-List-Received-Date: Tue, 05 Sep 2017 08:31:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 04/09/17 22:35, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Current implementation does not handle possible exceptions coming from child
> processes, the latter responsible for creating packages. With the aim to have more
> control, use pipes to communicate exceptions and stop package creation in case
> of failure.
> 
> Helps to debug [YOCTO #12012].
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>   meta/classes/package_deb.bbclass | 36 +++++++++++++++++++++++++++++++++---
>   meta/classes/package_ipk.bbclass | 36 +++++++++++++++++++++++++++++++++---
>   2 files changed, 66 insertions(+), 6 deletions(-)
> 

<chop>

> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index ec90996184..8439cda6dd 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -17,7 +17,29 @@ OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKA
>   OPKGLIBDIR = "${localstatedir}/lib"
>   
>   python do_package_ipk () {
> -    from multiprocessing import Process
> +    import multiprocessing
> +    import traceback
> +
> +    class IPKWritePkgProcess(multiprocessing.Process):
> +        def __init__(self, *args, **kwargs):
> +            multiprocessing.Process.__init__(self, *args, **kwargs)
> +            self._pconn, self._cconn = multiprocessing.Pipe()
> +            self._exception = None
> +
> +        def run(self):
> +            try:
> +                multiprocessing.Process.run(self)
> +                self._cconn.send(None)
> +            except Exception as e:
> +                tb = traceback.format_exc()
> +                self._cconn.send((e, tb))
> +
> +        @property
> +        def exception(self):
> +            if self._pconn.poll():
> +                self._exception = self._pconn.recv()
> +            return self._exception
> +

Other than the name is IPKWritePkgProcess the same as DebianWritePkgProcess?

If so, could we put a single WritePkgProcess class somewhere it can be 
shared in lib/oe ?

Joshua

