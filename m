Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ScHlh-0002eF-0a
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 17:03:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q56Er1Um008697
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 07:53:01 -0700 (PDT)
Received: from msp-dhcp45.wrs.com (172.25.34.45) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 6 Jun 2012 07:53:00 -0700
Message-ID: <4FCF6ECC.8010503@windriver.com>
Date: Wed, 6 Jun 2012 09:53:00 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1338994308.git.mark.hatle@windriver.com>
	<8d70e60114dace932ce1f205758593c931f59ed2.1338994308.git.mark.hatle@windriver.com>
In-Reply-To: <8d70e60114dace932ce1f205758593c931f59ed2.1338994308.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 6/6] insane.bbclass: Make ldd exec_prefix error reporting easier to read
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2012 15:03:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry please ignore this one, I sent it by accident.. The patch wasn't finished.

--Mark

On 6/6/12 9:53 AM, Mark Hatle wrote:
> Remove the long obtuse sysroot path from the ldd output, making the error
> message significantly easier to read and understand.
>
> Signed-off-by: Mark Hatle<mark.hatle@windriver.com>
> ---
>   meta/classes/insane.bbclass |    9 ++++++++-
>   1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 4d139e8..e845250 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -251,7 +251,14 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
>   			return False
>
>   		if sysroot_path_usr in ldd_output:
> -			error_msg = pn + ": %s links to something under exec_prefix" % path
> +			ldd_output = ldd_output.replace(sysroot_path, "")
> +
> +			pkgdest = d.getVar('PKGDEST', True)
> +			packages = d.getVar('PACKAGES', True)
> +
> +			short_path = path.replace('%s/%s' % (pkgdest, packages), "", 1)
> +
> +			error_msg = pn + ": %s links to something under exec_prefix (%s)" % (short_path, exec_prefix)
>   			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
>   			error_msg = "ldd reports: %s" % ldd_output
>   			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)



