Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sriram.sundararajan@gmail.com>) id 1T5hqB-0002lX-G2
	for Openembedded-core@lists.openembedded.org;
	Sun, 26 Aug 2012 20:45:43 +0200
Received: by iaky10 with SMTP id y10so6836521iak.6
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2012 11:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=F3uznKCnDoJGEE9bjgzKZSdW079QSXi5jwh4VLAnOt4=;
	b=x6eBl2oeAGe4VK9aZU1nmo7PjqBHGbZzqXRPMJOQ9Pxsv5onDltUt0+Hdj/XEMuMGk
	CZO0fxRF/H5ZXJBz8+DxV/soC27VCpyVJTjMdtwvHcXwBguVHOJAuySv148mwOQJTHKX
	sjc+IM12ltbD6gUJCdJunYinHA8XgeDQezLZB/SObW1WinbQrVEho9NeDWJVrFfScKWz
	NvOOKhSA5H2a2mdxoFJPAPxEJtVHXavO7F1JUrWTbfd43P5I2AfxN30NjanuicLhYLyU
	lCj2rYpg4vd9YXrVaXIgz2oShv80QixCf9TGzu6sZVm+WBVaXDt0Mu8Tmxv3YxRt97xz
	dDTw==
MIME-Version: 1.0
Received: by 10.50.202.8 with SMTP id ke8mr8050620igc.6.1346006012477; Sun, 26
	Aug 2012 11:33:32 -0700 (PDT)
Received: by 10.64.49.138 with HTTP; Sun, 26 Aug 2012 11:33:32 -0700 (PDT)
Date: Sun, 26 Aug 2012 12:33:32 -0600
Message-ID: <CAAeFaHY83=-vvqvrs8wNTkqAvoLVidp01ZHSzVXfAW=KX0n0iQ@mail.gmail.com>
From: Sriram Sundararajan <sriram.sundararajan@gmail.com>
To: oe-core <Openembedded-core@lists.openembedded.org>
Subject: tar: This does not look like a tar archive; bzip2-native folder has empty binaries
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
X-List-Received-Date: Sun, 26 Aug 2012 18:45:43 -0000
Content-Type: multipart/alternative; boundary=f46d04479ee53d40e504c82f722a

--f46d04479ee53d40e504c82f722a
Content-Type: text/plain; charset=ISO-8859-1

I was able to compile a 'core-image-minimal' on 08/23/12 without any
issues. On 08/25 however, I came across the following issue for the same
(bitbake core-image-minimal)

ERROR: Function failed: Unpack failure for URL: '
http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2'. Unpack
command
PATH="/opt/oe/oe-core/scripts/native-intercept:/opt/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native:blah:blah"
bzip2 -dc /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2 | tar x
--no-same-owner -f - failed with return value 2
ERROR: Logfile of failure stored in:
/opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3-r0.1/temp/log.do_unpack.3125
Log data follows:
| DEBUG: Executing python function do_unpack
| DEBUG: Executing python function base_do_unpack
| NOTE: Unpacking /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2 to
/opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3-r0.1/
| tar: This does not look like a tar archive
| tar: Exiting with failure status due to previous errors
| DEBUG: Python function base_do_unpack finished
| DEBUG: Python function do_unpack finished

The bzip2-native binary files (including appropriate symlinks) were present
under tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native, but were all
empty! I was able to copy my /bin/bz* to
/tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native and move on.  Don't
know much about bzip2-native, but bitbake bzip2-native had no effect.  Both
my installs were performed from scratch on identical ubuntu 12.04 installs.
The oe-core sources were cloned from gibhub. One on 08/23 and another on
08/25. There was a checkin reference to bzip2-native for
python-native_2.7.3.bb about a month back according to github.

Can anyone shed any light on why bzip tools were not compiled or installed
properly? What could've changed during these two days? I did a `find . |
grep bzip2-native` and saw some references to a folder
bzip2-native-1.0.6-r5. However, I could not find any references to
bzip2-full-native_1.0.6.bb or bzip2-native_1.0.6.bb. Now I'm scratching my
head and thinking where did this package come from in the first place? Any
help appreciated!

Thanks
Sriram

--f46d04479ee53d40e504c82f722a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I was able to compile a &#39;core-image-minimal&#39; on 08/23/12 without an=
y issues. On 08/25 however, I came across the following issue for the same =
(bitbake core-image-minimal)<br><br>ERROR: Function failed: Unpack failure =
for URL: &#39;<a href=3D"http://www.python.org/ftp/python/2.7.3/Python-2.7.=
3.tar.bz2">http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2</a>&=
#39;. Unpack command PATH=3D&quot;/opt/oe/oe-core/scripts/native-intercept:=
/opt/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/bzip2-native=
:blah:blah&quot; bzip2 -dc /opt/oe/oe-core/build/downloads/Python-2.7.3.tar=
.bz2 | tar x --no-same-owner -f - failed with return value 2<br>
ERROR: Logfile of failure stored in: /opt/oe/oe-core/build/tmp-eglibc/work/=
x86_64-linux/python-native-2.7.3-r0.1/temp/log.do_unpack.3125<br>Log data f=
ollows:<br>| DEBUG: Executing python function do_unpack<br>| DEBUG: Executi=
ng python function base_do_unpack<br>
| NOTE: Unpacking /opt/oe/oe-core/build/downloads/Python-2.7.3.tar.bz2 to /=
opt/oe/oe-core/build/tmp-eglibc/work/x86_64-linux/python-native-2.7.3-r0.1/=
<br>| tar: This does not look like a tar archive<br>| tar: Exiting with fai=
lure status due to previous errors<br>
| DEBUG: Python function base_do_unpack finished<br>| DEBUG: Python functio=
n do_unpack finished<br><br>The bzip2-native binary files (including approp=
riate symlinks) were present under tmp-eglibc/sysroots/x86_64-linux/usr/bin=
/bzip2-native, but were all empty! I was able to copy my /bin/bz* to /tmp-e=
glibc/sysroots/x86_64-linux/usr/bin/bzip2-native and move on.=A0 Don&#39;t =
know much about bzip2-native, but bitbake bzip2-native had no effect.=A0 Bo=
th my installs were performed from scratch on identical ubuntu 12.04 instal=
ls. The oe-core sources were cloned from gibhub. One on 08/23 and another o=
n 08/25. There was a checkin reference to bzip2-native for <a href=3D"http:=
//python-native_2.7.3.bb">python-native_2.7.3.bb</a> about a month back acc=
ording to github. <br>
<br>Can anyone shed any light on why bzip tools were not compiled or instal=
led properly? What could&#39;ve changed during these two days? I did a `fin=
d . | grep bzip2-native` and saw some references to a folder bzip2-native-1=
.0.6-r5. However, I could not find any references to <a href=3D"http://bzip=
2-full-native_1.0.6.bb">bzip2-full-native_1.0.6.bb</a> or <a href=3D"http:/=
/bzip2-native_1.0.6.bb">bzip2-native_1.0.6.bb</a>. Now I&#39;m scratching m=
y head and thinking where did this package come from in the first place? An=
y help appreciated!<br>
<br>Thanks<br>Sriram <br>

--f46d04479ee53d40e504c82f722a--
