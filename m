Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U1M2V-0005iT-Gc
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 20:12:47 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Feb 2013 10:56:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="285531843"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by fmsmga002.fm.intel.com with ESMTP; 01 Feb 2013 10:56:50 -0800
Message-ID: <510C0FF1.2010400@linux.intel.com>
Date: Fri, 01 Feb 2013 10:56:49 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1359708915.git.Qi.Chen@windriver.com>
	<b2319aaf09ba1dccdcd58cf067a1b0b1dd4ada93.1359708915.git.Qi.Chen@windriver.com>
	<CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
In-Reply-To: <CADkTA4Nc_fZbBTRbTi8ZbCZAa24_8r_qS9bCfXuoktisC4pavg@mail.gmail.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: add config fragments
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 19:12:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2013 06:18 AM, Bruce Ashfield wrote:
>
>
>
> On Fri, Feb 1, 2013 at 4:00 AM, <Qi.Chen@windriver.com
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>
>     Add config fragments to busybox.
>
>     Both the implementation and the use case are similar to yocto kernel's
>     configuration fragments.
>
>
> I can fairly easily tweak the configuration parts of the kern-tools to
> handle this
> use case as well. That would allow us to re-use the kernel's merge_config.sh
> script (with a minor dependency change) and save some duplicated code. It
> also gets you the advantage that you can consolidate configuration fragments
> outside of any build system, which isn't as critical here, but something
> that
> is used quite a bit during kernel testing.
>
Bruce,

Where is the merge_config.sh script today?  Would you propose moving it 
to the scripts dir and have the busybox recipe call it?

What would be your timing on making such a change, ie hold this patch 
until your get it merge or merge this and then fix it when you merge 
your changes?

Sau!

> To be clear, I'm not talking about the entire kern-tools here, just the
> config parts.
>
> Cheers,
>
> Bruce
>
>
>     [YOCTO #3379]
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>       meta/recipes-core/busybox/busybox.inc |   45
>     +++++++++++++++++++++++++++++++++
>       1 file changed, 45 insertions(+)
>
>     diff --git a/meta/recipes-core/busybox/busybox.inc
>     b/meta/recipes-core/busybox/busybox.inc
>     index 972e7d0..66044f8 100644
>     --- a/meta/recipes-core/busybox/busybox.inc
>     +++ b/meta/recipes-core/busybox/busybox.inc
>     @@ -112,8 +112,53 @@ do_prepare_config () {
>              fi
>       }
>
>     +# returns all the elements from the src uri that are .cfg files
>     +def find_cfgs(d):
>     +    sources=src_patches(d, True)
>     +    sources_list=[]
>     +    for s in sources:
>     +        if s.endswith('.cfg'):
>     +            sources_list.append(s)
>     +
>     +    return sources_list
>     +
>     +# Merge config fragments
>     +# All config fragments for busybox should end with .cfg
>     +do_merge_config() {
>     +        SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[=
>     ].*/\2/p"
>     +        MERGE_LIST="${@" ".join(find_cfgs(d))}"
>     +        if [ -n "$MERGE_LIST" ]; then
>     +                # Make a temp file, merge .config and .cfg files
>     into it
>     +                TMP_FILE=`mktemp .tmp.config.XXXXXXXX`
>     +                cp .config $TMP_FILE
>     +                for MERGE_FILE in $MERGE_LIST; do
>     +                        CFG_LIST=`sed -n "${SED_CONFIG_EXP}"
>     $MERGE_FILE`
>     +                        for CFG in $CFG_LIST ; do
>     +                                grep -q -w $CFG $TMP_FILE
>     +                                if [ $? -eq 0 ] ; then
>     +                                        PREV_VAL=`grep -w $CFG
>     $TMP_FILE`
>     +                                        NEW_VAL=`grep -w $CFG
>     $MERGE_FILE`
>     +                                        if [ "x$PREV_VAL" !=
>     "x$NEW_VAL" ] ; then
>     +                                                echo Value of $CFG
>     is redefined by fragment $MERGE_FILE:
>     +                                                echo Previous
>       value: $PREV_VAL
>     +                                                echo New value:
>        $NEW_VAL
>     +                                                echo
>     +                                        fi
>     +                                        sed -i "/$CFG[ =]/d" $TMP_FILE
>     +                                fi
>     +                        done
>     +                        echo >> $TMP_FILE
>     +                        cat $MERGE_FILE >> $TMP_FILE
>     +                done
>     +                # Copy the temp file to .config, do some cleanup
>     +               cp $TMP_FILE .config
>     +               rm $TMP_FILE
>     +        fi
>     +}
>     +
>       do_configure () {
>              do_prepare_config
>     +       do_merge_config
>              cml1_do_configure
>       }
>
>     --
>     1.7.9.5
>
>
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


