Received: from mail-bk0-f48.google.com ([209.85.214.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanglei.fage@gmail.com>) id 1Tz3K9-0004m5-Ee
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Jan 2013 11:49:25 +0100
Received: by mail-bk0-f48.google.com with SMTP id jk14so637895bkc.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2013 02:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=i3PzFathWzTJEbdUwwUl2Dxd7G6GPyT5pPp1PjGzbvk=;
	b=RzQVe1KnnHGLrZzyULDaYlFwOfZsCNPrhtvsOAvQkGu8yT081BCvdJnnoR6Ru82nCr
	imqmfueoEyl/TBZecBVpGfVCto8xA30YzuBoUuY5gyemqj9ZOa7lklhUCTq2Uphjc6vs
	OQxSaLpmTcKWldZn1f9Ao94u2nNG5VXA/iJ7t5zodQN0+ZdB/cvFW03V7EuyRVFHnxT0
	Qk1P6O3EIP21CR3n+H/zPnyQmTpVcvb2bWsE0jLBxLTtqjzFVk8ft+aShzPX8CQOznVH
	u+GnmPQFBAxknkmX7NB+CUqanm9Yu3p+E7BbfLriVXXW6/lTXM6zkdu/ISrS3Pv/wXy/
	l6lg==
MIME-Version: 1.0
X-Received: by 10.204.130.149 with SMTP id t21mr2536302bks.43.1359196429786;
	Sat, 26 Jan 2013 02:33:49 -0800 (PST)
Received: by 10.204.185.8 with HTTP; Sat, 26 Jan 2013 02:33:49 -0800 (PST)
In-Reply-To: <51039E47.8090701@windriver.com>
References: <1359026733-1392-1-git-send-email-Xin.Ouyang@windriver.com>
	<51039E47.8090701@windriver.com>
Date: Sat, 26 Jan 2013 18:33:49 +0800
Message-ID: <CAHsH0E-tkhtD-30XWaLr8AbC-Xn=gi9+aYqWsnoQ06ywVd-isQ@mail.gmail.com>
From: lei yang <yanglei.fage@gmail.com>
To: Pascal Ouyang <xin.ouyang@windriver.com>
Cc: openembedded-core@www.linuxtogo.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [V2 PATCH] libcgroup: fix the QA issue for pam_cgroup.so*
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
X-List-Received-Date: Sat, 26 Jan 2013 10:49:28 -0000
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 26, 2013 at 5:13 PM, Pascal Ouyang <xin.ouyang@windriver.com> w=
rote:
> =D3=DA 2013=C4=EA01=D4=C224=C8=D5 19:25, Xin Ouyang =D0=B4=B5=C0:
>
>> PAM modules in ${base_libdir}/security/ should be binary .so files,
>> not symlinks, so fix this. Since pam_cgroup.so is installed into
>> ${base_libdir}/security, move libcgroup.so.* to ${base_libdir} to
>> avoid "unsafe-references-in-binaries" QA issue.
>>
>> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
>> ---
>>   meta/recipes-core/libcgroup/libcgroup_0.37.1.bb |   15 +++++++++++++--
>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
>> b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
>> index e74f831..d217f7b 100644
>> --- a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
>> +++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
>> @@ -23,5 +23,16 @@ FILES_cgroups-pam-plugin =3D
>> "${base_libdir}/security/pam_cgroup.so*"
>>   FILES_${PN}-dbg +=3D "${base_libdir}/security/.debug"
>>   FILES_${PN}-dev +=3D "${base_libdir}/security/*.la"
>>
>> -# We really need the symlink so :(
>> -INSANE_SKIP_cgroups-pam-plugin =3D "dev-so"
>> +do_install_append() {
>> +       # Moving libcgroup to base_libdir
>> +       if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
>> +               mkdir -p ${D}/${base_libdir}/
>> +               mv -f ${D}${libdir}/libcgroup.so.* ${D}${base_libdir}/
>> +               ln -sf ${D}${base_libdir}/libcgroup.so.1
>> ${D}${libdir}/libcgroup.so
>
>
> I should not use absolute path for this symlink here.
>
> rel_lib_prefix=3D`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
> ln -sf ${rel_lib_prefix}${base_libdir}/libcgroup.so.1 \
>

I think use

cd ${D}
ln -sf libcgroup.so.1 ${D}${libdir}/libcgroup.so

should be OK, no need sed to handle


Lei

>        ${D}${libdir}/libcgroup.so
>
> V3 will be sent. Thanks.
>
> - Pascal
>
>
>> +       fi
>> +       # pam modules in ${base_libdir}/security/ should be binary .so
>> files, not symlinks.
>> +       if [ -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0 ]; then
>> +               mv -f ${D}${base_libdir}/security/pam_cgroup.so.0.0.0
>> ${D}${base_libdir}/security/pam_cgroup.so
>> +               rm -f ${D}${base_libdir}/security/pam_cgroup.so.*
>> +       fi
>> +}
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


