Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4404D70641
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 16:27:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2014 09:27:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,679,1400050800"; d="scan'208";a="571375942"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2014 09:26:30 -0700
Message-ID: <53C7F936.3030407@linux.intel.com>
Date: Thu, 17 Jul 2014 09:26:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Daniel BORNAZ <daniel.bornaz@enea.com>, yocto@yoctoproject.org, 
	openembedded-core@lists.openembedded.org
References: <1405592877-16855-1-git-send-email-daniel.bornaz@enea.com>
In-Reply-To: <1405592877-16855-1-git-send-email-daniel.bornaz@enea.com>
Cc: Benjamin Peterson <benjamin@python.org>
Subject: Re: [PATCH] _json module arbitrary process memory read vulnerability
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
X-List-Received-Date: Thu, 17 Jul 2014 16:27:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2014 03:27 AM, Daniel BORNAZ wrote:
> python-native: _json module arbitrary process memory read vulnerability
>
> http://bugs.python.org/issue21529
>
> Python 2 and 3 are susceptible to arbitrary process memory reading by
> a user or adversary due to a bug in the _json module caused by
> insufficient bounds checking.
>
> The sole prerequisites of this attack are that the attacker is able to
> control or influence the two parameters of the default scanstring
> function: the string to be decoded and the index.
>
> The bug is caused by allowing the user to supply a negative index
> value. The index value is then used directly as an index to an array
> in the C code; internally the address of the array and its index are
> added to each other in order to yield the address of the value that is
> desired. However, by supplying a negative index value and adding this
> to the address of the array, the processor's register value wraps
> around and the calculated value will point to a position in memory
> which isn't within the bounds of the supplied string, causing the
> function to access other parts of the process memory.
>
> Signed-off-by: Benjamin Peterson <benjamin@python.org>
>
>
> Applied to python-native recipe in order to fix the above mentioned vulnerability.
>
> Upstream-Status: Submitted
>
> Signed-off-by: Daniel BORNAZ <daniel.bornaz@enea.com>
>
> ---
>   meta/recipes-devtools/python/python-native_2.7.3.bb  |  1 +
>   .../python/python/python-json-flaw-fix.patch         | 20 ++++++++++++++++++++
>   2 files changed, 21 insertions(+)
>   create mode 100644 meta/recipes-devtools/python/python/python-json-flaw-fix.patch
>
> diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
> index 0571d3a..74f0dfc 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
> @@ -19,6 +19,7 @@ SRC_URI += "\
>              file://parallel-makeinst-create-bindir.patch \
>              file://python-fix-build-error-with-Readline-6.3.patch \
>              file://gcc-4.8-fix-configure-Wformat.patch \
> +           file://python-json-flaw-fix.patch \
>              "
>   S = "${WORKDIR}/Python-${PV}"
>
> diff --git a/meta/recipes-devtools/python/python/python-json-flaw-fix.patch b/meta/recipes-devtools/python/python/python-json-flaw-fix.patch
> new file mode 100644
> index 0000000..631713d
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python/python-json-flaw-fix.patch
> @@ -0,0 +1,20 @@
> +--- a/Modules/_json.c	2014-07-15 15:37:17.151046356 +0200
> ++++ b/Modules/_json.c	2014-07-15 15:38:37.335605042 +0200

You need to to have the Upstream-Status in the patch file itself, along 
with a Signed-off-by, so that the information in available here.

Thanks
	Sau!

> +@@ -1491,7 +1491,7 @@ scan_once_str(PyScannerObject *s, PyObje
> +     PyObject *res;
> +     char *str = PyString_AS_STRING(pystr);
> +     Py_ssize_t length = PyString_GET_SIZE(pystr);
> +-    if (idx >= length) {
> ++    if ( idx < 0 || idx >= length) {
> +         PyErr_SetNone(PyExc_StopIteration);
> +         return NULL;
> +     }
> +@@ -1578,7 +1578,7 @@ scan_once_unicode(PyScannerObject *s, Py
> +     PyObject *res;
> +     Py_UNICODE *str = PyUnicode_AS_UNICODE(pystr);
> +     Py_ssize_t length = PyUnicode_GET_SIZE(pystr);
> +-    if (idx >= length) {
> ++    if ( idx < 0 || idx >= length) {
> +         PyErr_SetNone(PyExc_StopIteration);
> +         return NULL;
> +     }
>

