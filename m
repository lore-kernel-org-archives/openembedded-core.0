Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rj5Yt-0006eX-0S
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 09:54:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2012 00:46:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="95114094"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2012 00:46:30 -0800
Message-ID: <4F06B4E5.7090901@linux.intel.com>
Date: Fri, 06 Jan 2012 00:46:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325837822.git.wenzong.fan@windriver.com>
	<b63c8a5a0cf70a797fd49844b7854151a58f579e.1325837822.git.wenzong.fan@windriver.com>
In-Reply-To: <b63c8a5a0cf70a797fd49844b7854151a58f579e.1325837822.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 1/1] archive.bbclass: archive work directory
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
X-List-Received-Date: Fri, 06 Jan 2012 08:54:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 12:20 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> Some legal departments believe a complete archive of the work directory
> is required for certain license compliance issues. We could therefore
> do with a class which archives up the work directories in each build and
> provide them so those legal departments can be happy.
>
> Implementations:
>
> Add a new class named 'archive.bbclass' to provide task 'do_archive',
> and get it called after 'do_patch' before 'do_configure'.
>
> Following cases should be considered to the sources dirs:
> 1) The sources dir is under $WORKDIR:
> Just archive sources and temp/run.* up.
>
> 2) The sources dir is outside of $WORKDIR, the only package is gcc:
> Copy its sources and temp/run.* to a temporary dir and then archive
> them up.
>
> 3) The sources dir is equal to $WORKDIR:
> Just archive whole work dir up.
>
> [YOCTO #1590]
>
> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
> ---
>   meta/classes/archive.bbclass |   42 ++++++++++++++++++++++++++++++++++++++++++
>   1 files changed, 42 insertions(+), 0 deletions(-)
>   create mode 100644 meta/classes/archive.bbclass
>
> diff --git a/meta/classes/archive.bbclass b/meta/classes/archive.bbclass
> new file mode 100644
> index 0000000..75ac090
> --- /dev/null
> +++ b/meta/classes/archive.bbclass
> @@ -0,0 +1,42 @@
> +# Archive the patched sources and build scripts to assist in license
> +# compliance by the end user or legal departments.
> +
> +ARCHIVE_DIR = "${TMPDIR}/archives/${MULTIMACH_TARGET_SYS}/"
> +do_archive[dirs] = "${ARCHIVE_DIR}"
> +
I see you set ARCHIVE_DIR, but I don' see you move or copy any files to 
this directory, am I missing something?

> +archive_do_archive() {
> +    # In mostly scenarios the $S is under $WORKDIR and has a separate
> +    # dir for storing the sources; but gcc is a special case, its sources
> +    # had been moved to the shared location 'tmp/work-shared/'
> +    if [[ -d ${S}&&  ${S} != ${WORKDIR} ]]; then
> +        if [[ ${S} =~ "/work-shared/gcc" ]]; then
> +            # Create temporary sources directory for gcc
> +            mkdir -p ${PF}/temp
> +            cp -r ${S} ${PF}
> +            cp -r ${S}/../temp/* ${PF}/temp
> +            cp -r ${WORKDIR}/temp/* ${PF}/temp
> +            tarbase=`pwd`
> +        else
> +            tarbase=`dirname ${WORKDIR}`
> +        fi
> +
> +        sourcedir=`basename ${S}`
> +        tar -C $tarbase -cjf ${PF}.tar.bz2 ${PF}/$sourcedir \
> +            ${PF}/temp --exclude log.do_*
> +
Also, do you want to name the tarball PF or BP, which deals with 
removing any multilib naming issues if the build it multilib.

Note BP = ${BPN}-${PV} so it removes the ${PR} if that is important 
(which it might be).

> +        # Remove the temporary gcc sources directory
> +        if [[ ${S} =~ "/work-shared/gcc"&&  -d ${PF} ]]; then
> +            rm -rf ${PF}
> +        fi
> +    fi
> +
> +    # Just archive whole build directory up when $S is equal to $WORKDIR
> +    if [[ -d ${S}&&  ${S} == ${WORKDIR} ]]; then
> +        tarbase=`dirname ${WORKDIR}`
> +        tar -C $tarbase -cjf ${PF}.tar.bz2 ${PF} --exclude log.do_*
> +    fi
> +}
> +
> +addtask do_archive after do_patch before do_configure
> +
> +EXPORT_FUNCTIONS do_archive


