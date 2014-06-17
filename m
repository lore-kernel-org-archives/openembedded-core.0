Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AEE366FFDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 20:36:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2014 13:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,496,1400050800"; d="scan'208";a="557009136"
Received: from unknown (HELO [10.255.12.166]) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2014 13:36:33 -0700
Message-ID: <53A0A6D1.7010206@linux.intel.com>
Date: Tue, 17 Jun 2014 13:36:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: =?UTF-8?B?TWlyb3NsYXYgS2XFoQ==?= <miroslav.kes@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
References: <539B27F0.90109@gmail.com>	<CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
	<53A0A2F0.2020701@gmail.com>
In-Reply-To: <53A0A2F0.2020701@gmail.com>
Subject: Re: cmake: respect ${S} and ${B} patch problem
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
X-List-Received-Date: Tue, 17 Jun 2014 20:36:57 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/17/2014 01:20 PM, Miroslav Keš wrote:
> On 06/13/14 18:38, Burton, Ross wrote:
>> On 13 June 2014 17:33, Miroslav Keš <miroslav.kes@gmail.com> wrote:
>>> +    if [ -z "${OECMAKE_SOURCEPATH}" ]; then
>>> +        OECMAKE_SOURCEPATH="${S}"
>>>       fi
>>>
>>>       if [ "${S}" != "${B}" ]; then
>>> @@ -84,7 +88,7 @@ cmake_do_configure() {
>>>
>>>       cmake \
>>>         ${OECMAKE_SITEFILE} \
>>> -      ${S} \
>>> +      ${OECMAKE_SOURCEPATH} \
>> A better idiom that's more self-documenting would be to set
>> OECMAKE_SOURCEPATH ?= "${S}" at the top-level.
>>
>> Would it be sensible to give that variable a different name as it
>> refers specifically to the location of the cmake file, and not the
>> rest of the source?
>>
>> Ross
>
> Here is the updated patch:
>

Can you send this as a proper v2 patch please.
Thanks
	Sau!

> Signed-off-by: Mira Kes <miroslav.kes@gmail.com>
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index c9c15f3..f762792 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -23,6 +23,9 @@ OECMAKE_RPATH ?= ""
>   OECMAKE_PERLNATIVE_DIR ??= ""
>   OECMAKE_EXTRA_ROOT_PATH ?= ""
>
> +# Path to the CMake file to process.
> +OECMAKE_SOURCEPATH ?= "${S}"
> +
>   cmake_do_generate_toolchain_file() {
>          cat > ${WORKDIR}/toolchain.cmake <<EOF
>   # CMake system name must be something like "Linux".
> @@ -65,8 +68,8 @@ EOF
>   addtask generate_toolchain_file after do_patch before do_configure
>
>   cmake_do_configure() {
> -       if [ "${OECMAKE_BUILDPATH}" -o "${OECMAKE_SOURCEPATH}" ]; then
> -               bbnote "cmake.bbclass no longer uses OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
> +       if [ "${OECMAKE_BUILDPATH}" ]; then
> +               bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
>          fi
>
>          if [ "${S}" != "${B}" ]; then
> @@ -84,7 +87,7 @@ cmake_do_configure() {
>
>          cmake \
>            ${OECMAKE_SITEFILE} \
> -         ${S} \
> +         ${OECMAKE_SOURCEPATH} \
>            -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
>            -DCMAKE_INSTALL_BINDIR:PATH=${bindir} \
>            -DCMAKE_INSTALL_SBINDIR:PATH=${sbindir} \
>
>

