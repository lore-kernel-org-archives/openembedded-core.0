Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 324BD780BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 23:50:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Nov 2017 15:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,449,1505804400"; d="scan'208,217";a="6061923"
Received: from davidsol-mobl.amr.corp.intel.com (HELO [10.252.250.52])
	([10.252.250.52])
	by orsmga003.jf.intel.com with ESMTP; 24 Nov 2017 15:50:45 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1508360667.git.alejandro.hernandez@linux.intel.com>
	<dec09146d2c3b9c8ee079613586d8c70cd5b7d72.1508360667.git.alejandro.hernandez@linux.intel.com>
	<CAJTo0LZ9zc9iUDvqT0an2LFgNszckm2PKkTD__XQZ253YoeOrw@mail.gmail.com>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <8d583189-724f-e88a-1a65-628b5cfa2269@linux.intel.com>
Date: Fri, 24 Nov 2017 17:50:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ9zc9iUDvqT0an2LFgNszckm2PKkTD__XQZ253YoeOrw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python3: Restructure python3 packaging and replace it with autopackaging
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
X-List-Received-Date: Fri, 24 Nov 2017 23:50:56 -0000
Content-Type: multipart/alternative;
	boundary="------------34B1A015B503EC3DE2128351"
Content-Language: en-US

--------------34B1A015B503EC3DE2128351
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hey Ross,


The thing is that we do need them on the native sysroot, since when we 
are creating a new manifest, it uses python-native to do that, and it 
needs to match those files, if they dont exist, they end up in another 
package.


Alejandro


On 11/24/2017 11:05 AM, Burton, Ross wrote:
> On 18 October 2017 at 22:07, Alejandro Hernandez 
> <alejandro.hernandez@linux.intel.com 
> <mailto:alejandro.hernandez@linux.intel.com>> wrote:
>
>     @@ -77,8 +75,30 @@ do_install() {
>                     sed -i -e '1s|^#!.*|#!/usr/bin/env python3|'
>     $PYTHSCRIPT
>             done
>
>     -       # Tests are large and we don't need them in the native sysroot
>     -       rm ${D}${libdir}/python${PYTHON_MAJMIN}/test -rf
>     +        # Add a symlink to the native Python so that scripts can
>     just invoke
>     +        # "nativepython" and get the right one without needing
>     absolute paths
>     +        # (these often end up too long for the #! parser in the
>     kernel as the
>     +        # buffer is 128 bytes long).
>     +        ln -s python3-native/python3 ${D}${bindir}/nativepython3
>
>
> Is that rm of the tests redundant?
>
> Ross
>


--------------34B1A015B503EC3DE2128351
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Ross,<br>
    </p>
    <p><br>
    </p>
    <p>The thing is that we do need them on the native sysroot, since
      when we are creating a new manifest, it uses python-native to do
      that, and it needs to match those files, if they dont exist, they
      end up in another package.</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 11/24/2017 11:05 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJTo0LZ9zc9iUDvqT0an2LFgNszckm2PKkTD__XQZ253YoeOrw@mail.gmail.com">
      <div dir="ltr">On 18 October 2017 at 22:07, Alejandro Hernandez <span
          dir="ltr">&lt;<a
            href="mailto:alejandro.hernandez@linux.intel.com"
            target="_blank" moz-do-not-send="true">alejandro.hernandez@linux.intel.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">@@ -77,8
              +75,30 @@ do_install() {<br>
                              sed -i -e '1s|^#!.*|#!/usr/bin/env
              python3|' $PYTHSCRIPT<br>
                      done<br>
              <br>
              -       # Tests are large and we don't need them in the
              native sysroot<br>
              -       rm ${D}${libdir}/python${PYTHON_<wbr>MAJMIN}/test
              -rf<br>
              +        # Add a symlink to the native Python so that
              scripts can just invoke<br>
              +        # "nativepython" and get the right one without
              needing absolute paths<br>
              +        # (these often end up too long for the #! parser
              in the kernel as the<br>
              +        # buffer is 128 bytes long).<br>
              +        ln -s python3-native/python3
              ${D}${bindir}/nativepython3<br>
            </blockquote>
            <div><br>
            </div>
            <div>Is that rm of the tests redundant?</div>
            <div><br>
            </div>
            <div>Ross</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------34B1A015B503EC3DE2128351--
